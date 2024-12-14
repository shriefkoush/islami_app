import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/AppColors.dart';
import 'package:islami/model/Sura_Model.dart';

import 'Sura_Details_Screen.dart';
import 'Sura_List_Widget.dart';

class Quran_Tab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/QuranTabLogo.png"),
          TextField(
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: AppColors.primaryDark, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: AppColors.primaryDark, width: 2)),
                prefixIcon:const ImageIcon(AssetImage("assets/images/SearchImage.png"),
                  color: AppColors.primaryDark,),
              hintText: "Sura Name",
              hintStyle: TextStyle(color: AppColors.whiteColor)


            ),
          ),
          SizedBox(height: 20,),
          Text("Most Recently",style: TextStyle(color: AppColors.whiteColor,fontSize: 17),),
          SizedBox(height: 10,),
          Container(decoration: BoxDecoration(color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(20)),
          child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text("Sura En"),
              Text("Sura Ar"),
              Text("Aya Number")
            ],),
            Image(image: AssetImage("assets/images/MostRecentlyImage.png"))
          ],),
          ),
          SizedBox(height: 10,),
          Text("Sura list",style: TextStyle(color: AppColors.whiteColor,fontSize: 17),),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(separatorBuilder: (context,index){
              return Divider(color: AppColors.whiteColor,indent:30 ,endIndent:30,thickness: 2,);
            },
            itemBuilder: (context,index){
              return InkWell(onTap: (){
                Navigator.of(context).pushNamed(SuraDetailsScreen.routeName);
              },
              child: SuraListWidget(
                sura_model: Sura_Model.getSuraModel(index),
              ));
            },
            itemCount: Sura_Model.getItemCount(),
              padding: EdgeInsets.zero,
            ),
          )
        ],
      ),
    );
  }
}
