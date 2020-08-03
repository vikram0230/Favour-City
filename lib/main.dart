import 'package:favoucite/home.dart';
import 'package:favoucite/splash_screen.dart';
import 'package:flutter/material.dart';

import 'favourite_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        'home': (context) => Home(),
        'fav': (context) => FavouriteScreen(),
      },
      title: 'Flutter Demo',
    );
  }
}
