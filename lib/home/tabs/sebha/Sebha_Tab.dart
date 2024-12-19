import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../AppColors.dart';

class Sebha_Tab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(margin:EdgeInsets.all(12) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/QuranTabLogo.png"),
          Center(
            child: Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
              style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Stack(alignment: Alignment.center,
              children:[ Image.asset("assets/images/Sebha_Shape.png"),
                Column(children: [
                  Text("سبحان الله",style: TextStyle(color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),),
                  SizedBox(height: 30,),
                  Text("30",style: TextStyle(color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),)
                ],)
              ])
        ],
      ),
    );
  }
}
