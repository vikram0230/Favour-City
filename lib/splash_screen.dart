import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () => Navigator.pushReplacementNamed(context, 'home'));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.location_on, size: 200, color: Colors.redAccent,),
              SizedBox(height: 30,),
              Text('FAVOUR CITY', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.redAccent),)
            ],
          ),
        ),
      ),
    );
  }
}
