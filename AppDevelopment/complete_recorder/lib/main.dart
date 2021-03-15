import 'package:complete_recorder/App%20Pages/splash_screen.dart';
import 'package:complete_recorder/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(home: SplashScreen()));
}

//PAGE 2 - LIBRARY, FOLDERS, ETC...
class Homepage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Accessing the home of the material widget and drawing the scaffold onto it
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: HomePage(),
    );
  }
}
