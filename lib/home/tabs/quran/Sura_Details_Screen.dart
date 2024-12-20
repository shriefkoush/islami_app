import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/AppColors.dart';
import 'package:islami/home/tabs/quran/SuraContentItem.dart';
import 'package:islami/model/Sura_Model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetailsScreen";


  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Sura_Model;
    if (verses.isEmpty) {
      loadSuraFile(args.fileName);
    }
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 55),
          child: Center(
              child: Text(
            args.SuraEnglishName,
            style: TextStyle(color: AppColors.primaryDark),
          )),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColors.blackColor,
            child: Image.asset(
              "assets/images/details_bg.png",
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 17,
              ),
              Text(
                args.SuraArabicName,
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 24,
                ),
              ),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryDark,
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.only(top: 20),
                        itemBuilder: (context, index) {
                          return SuraContentItem(
                            content: verses[index],
                            index: index,
                          );
                        },
                        itemCount: verses.length,
                      ),
              )
            ],
          )
        ],
      ),
    );
  }

  void loadSuraFile(String fileName) async {
    String suraContent =
        await rootBundle.loadString("assets/files/$fileName}.txt");
    List<String> suraLines = suraContent.split('\n');
    for (int i = 0; i < suraLines.length; i++) {
      print(suraLines[i]);
    }
    verses = suraLines;
    setState(() {});
  }
}
