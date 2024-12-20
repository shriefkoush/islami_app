import 'package:flutter/cupertino.dart';
import 'package:islami/AppColors.dart';
import 'package:islami/model/Sura_Model.dart';

class SuraListWidget extends StatelessWidget {
  Sura_Model sura_model;
  int index;
  SuraListWidget({required this.sura_model,required this.index
  });
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Stack(alignment: Alignment.center,
      children: [
        Image.asset("assets/images/VectorNumber.png"),
        Text("${index+1}"
          ,style: TextStyle(color: AppColors.whiteColor),),
      ],),
      SizedBox(width: 15,),
      Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Text(sura_model.SuraEnglishName,style: TextStyle(color: AppColors.whiteColor),),
              Text("${sura_model.NumOfVerses} verse",style: TextStyle(color: AppColors.whiteColor),)
            ],),
            Text(sura_model.SuraArabicName,style: TextStyle(color: AppColors.whiteColor),)
          ],
        ),
      ),
      
    ],
    );
  }
}
