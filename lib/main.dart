import 'package:flutter/material.dart';
import 'package:islami/home/Home_Screen.dart';
import 'package:islami/MyThemeData.dart';

import 'home/tabs/quran/Sura_Details_Screen.dart';

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
        SuraDetailsScreen.routeName :(context) =>SuraDetailsScreen(),
      } ,
      darkTheme: MyThemeData.darktheme,
    );
  }
}