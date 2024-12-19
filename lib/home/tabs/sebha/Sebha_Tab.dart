import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../AppColors.dart';

class Sebha_Tab extends StatefulWidget {
  @override
  State<Sebha_Tab> createState() => _Sebha_TabState();
}

class _Sebha_TabState extends State<Sebha_Tab> {
  double turns = 0.0;
  int counter = 0;

  void _changeRotation() {
    setState(() => turns += 1.0 / 80.0);
  }

  int index = 0;
  List<String> sebhaText = [
    "الله اكبر ",
        "الحمدلله",
    "لا حول ولا قوة الا بالله"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
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
          Stack(alignment: Alignment.center, children: [
            InkWell(
              onTap: onKlick,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: AnimatedRotation(
                  turns: turns,
                    duration: Duration(seconds: 1),
                    child: Image.asset("assets/images/Sebha_Shape.png")),
              ),
            ),
            Column(
              children: [
                Text(
                  sebhaText[index],
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "$counter",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                )
              ],
            )
          ])
        ],
      ),
    );
  }

  void onKlick() {
    counter++;
    if (counter % 33 == 0) {
      index++;
    }
    if (index == sebhaText.length) {
      index = 0;
    }
    setState(() {
      _changeRotation();
    });
  }
}
