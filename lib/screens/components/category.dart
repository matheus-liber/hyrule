import 'package:flutter/material.dart';
import 'package:hyrule/screens/results.dart';
import 'package:hyrule/utils/colors.dart';
import 'package:hyrule/utils/consts/categories.dart';
import 'package:hyrule/utils/fonts.dart';

class Category extends StatelessWidget {
const Category({ Key? key, required this.category }) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context){
    return Column(children: <Widget>[
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: AppColors.greyColor,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: AppColors.blueColor,
              width: 2.0,
            ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Results(category: category)));
            },
            child: Ink(
              child: Center(
                child: Image.asset("$imagePath$category.png"),
              ),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 7),
            child: Text(categories[category]!,style: AppFonts.blueTextStyle,)
        ),
    ],);
  }
}