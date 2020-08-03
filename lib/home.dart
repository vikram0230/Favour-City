import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'moor_database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = 'https://indian-cities-api-nocbegfhqg.now.sh/cities';
  String searchUrl =
      'https://indian-cities-api-nocbegfhqg.now.sh/cities?City_like=';
  var data;
  var database;
  var favData;

  Future getJsonData() async {
    var response = await http.get(url);
    var convertedData = json.decode(response.body);
    data = convertedData;
    setState(() {});
    return data;
  }

  Future getSearchData(String key) async {
    var response = await http.get(searchUrl + key);
    var convertedData = json.decode(response.body);
    data = convertedData;
    setState(() {});
    return data;
  }

  getFavData() async {
    favData = await database.getAllTasks();
  }

  @override
  void initState() {
    super.initState();
    database = AppDatabase();
    getFavData();
    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Favour City',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 13.0),
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.redAccent,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'fav').whenComplete(() {
                  setState(() {});
                });
              },
            ),
          ),
        ],
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              onChanged: (value) {
                getSearchData(value);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: getJsonData,
              color: Colors.redAccent,
              child: FutureBuilder(
                future: (data == null) ? getJsonData() : getFavData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: (data == null)? 0 : data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final favourite = Favourite(
                          city: data[index]['City'],
                          district: data[index]['District'],
                          state: data[index]['State'],
                        );
                        return ListTile(
                          leading: Icon(Icons.label_important),
                          title: Text(favourite.city),
                          subtitle: Text(
                            '${favourite.district}, ${favourite.state}',
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              (favData.contains(favourite))
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.redAccent,
                            ),
                            onPressed: () async {
                              (favData.contains(favourite))
                                  ? database.deleteTask(favourite)
                                  : database.insertTask(favourite);
                              setState(() {});
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.redAccent),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
