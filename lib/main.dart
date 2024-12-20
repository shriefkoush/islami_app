import 'package:flutter/material.dart';
import 'package:islami/home/Home_Screen.dart';
import 'package:islami/MyThemeData.dart';
import 'package:islami/home/tabs/hadeth/HadethDetailsScree.dart';

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
        HadethDetailsScree.routeName :(context) =>HadethDetailsScree(),
      } ,
      darkTheme: MyThemeData.darktheme,
    );
  }
}