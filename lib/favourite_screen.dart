import 'package:flutter/material.dart';

import 'moor_database.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  var favData;
  var database;

  getFavListItems() async {
    favData = await database.getAllTasks();
    return favData;
  }

  @override
  void initState() {
    super.initState();
    database = AppDatabase();
    getFavListItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.redAccent,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Favourites',
          style: TextStyle(
            color: Colors.redAccent,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getFavListItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            return ListView.builder(
              itemCount: favData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.label_important),
                  title: Text(favData[index].city),
                  subtitle: Text(
                    '${favData[index].district}, ${favData[index].state}',
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      (favData.contains(favData[index]))
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.redAccent,
                    ),
                    onPressed: () async {
                      (favData.contains(favData[index]))
                          ? database.deleteTask(favData[index])
                          : database.insertTask(favData[index]);
                      setState(() {});
                    },
                  ),
                );
              },
            );
          } else{
            return Center(
              child: CircularProgressIndicator(
                valueColor:
                AlwaysStoppedAnimation<Color>(Colors.redAccent),
              ),
            );
          }
        },
      ),
    );
  }
}


