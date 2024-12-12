import 'package:flutter/material.dart';

import 'AppColors.dart';

class MyThemeData{
 static final ThemeData darktheme =ThemeData(
   scaffoldBackgroundColor: Colors.transparent,
     bottomNavigationBarTheme:BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      showSelectedLabels: true,
      unselectedItemColor: AppColors.blackColor,
      showUnselectedLabels: false
 )
 );


}