import 'package:flutter/material.dart';
import 'package:islami/Home_Screen.dart';
import 'package:islami/MyThemeData.dart';

void main (){
  runApp(IslamiApp());
}
class IslamiApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeScreen.routeName ,
      routes:{HomeScreen.routeName :(context) =>HomeScreen(),
      } ,
      darkTheme: MyThemeData.darktheme,
    );
  }
}