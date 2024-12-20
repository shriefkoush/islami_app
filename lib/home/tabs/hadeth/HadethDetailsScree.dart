import 'package:flutter/material.dart';

import '../../../AppColors.dart';
import 'HadethModel.dart';

class HadethDetailsScree extends StatelessWidget {
  static const String routeName= "HadethDetailsScree";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      appBar: AppBar(),
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
                args.title,
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 24,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 20),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 4),
                      child: Text(args.content[index],
                        style:TextStyle(color: AppColors.primaryDark,fontSize: 18) ,),
                    );
                  },
                  itemCount: args.content.length,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
