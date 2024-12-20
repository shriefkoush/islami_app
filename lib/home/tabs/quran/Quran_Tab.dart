import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/AppColors.dart';
import 'package:islami/model/Sura_Model.dart';

import 'Sura_Details_Screen.dart';
import 'Sura_List_Widget.dart';

class Quran_Tab extends StatefulWidget {
  @override
  State<Quran_Tab> createState() => _Quran_TabState();
}

class _Quran_TabState extends State<Quran_Tab> {
  void addSuraList(){
    for (int i=0 ;i<114;i++){
      Sura_Model.SuraList.add(Sura_Model(SuraArabicName: Sura_Model.SuraArabicNameList[i],
          SuraEnglishName: Sura_Model.SuraEnglishNameList[i],
          NumOfVerses: Sura_Model.NumberOfVersesList[i],
          fileName: "${i+1}.txt"));
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addSuraList();
  }
  List<Sura_Model> filterList = Sura_Model.SuraList;
  String searchText ="";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/QuranTabLogo.png"),
          TextField(
            style:TextStyle(color: AppColors.whiteColor) ,
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      const BorderSide(color: AppColors.primaryDark, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      const BorderSide(color: AppColors.primaryDark, width: 2)),
                prefixIcon:const ImageIcon(AssetImage("assets/images/SearchImage.png"),
                  color: AppColors.primaryDark,),
              hintText: "Sura Name",
              hintStyle: const TextStyle(color: AppColors.whiteColor)


            ),
            onChanged: (text){
              searchText = text;
             filterList = Sura_Model.SuraList.where((sura){
                return sura.SuraArabicName.contains(searchText)||
                sura.SuraEnglishName.toLowerCase().contains(searchText.toLowerCase());
              }).toList();
             setState(() {

             });

            },
          ),
          const SizedBox(height: 20,),
          searchText.isNotEmpty?
              SizedBox()
              :
          builtMostRecently(),
          const SizedBox(height: 10,),
          const Text("Sura list",style: TextStyle(color: AppColors.whiteColor,fontSize: 17),),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(separatorBuilder: (context,index){
              return const Divider(color: AppColors.whiteColor,indent:30 ,endIndent:30,thickness: 2,);
            },
            itemBuilder: (context,index){
              return InkWell(onTap: (){
                Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
                arguments: filterList[index]
                );

              },
              child: SuraListWidget(
                index:index,
                sura_model: filterList[index]
              ));
            },
            itemCount: filterList.length,
              padding: EdgeInsets.zero,
            ),
          )
        ],
      ),
    );
  }

 Widget builtMostRecently() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const Text("Most Recently",style: TextStyle(color: AppColors.whiteColor,fontSize: 17),),
      const SizedBox(height: 10,),
      Container(decoration: BoxDecoration(color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(20)),
        child: const Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text("Sura En"),
              Text("Sura Ar"),
              Text("Aya Number")
            ],),
            Image(image: AssetImage("assets/images/MostRecentlyImage.png"))
          ],),
      ),
    ],);
 }
}
