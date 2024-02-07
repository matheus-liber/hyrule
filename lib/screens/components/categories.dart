import 'package:flutter/material.dart';
import 'package:hyrule/screens/results.dart';
import 'package:hyrule/utils/consts/categories.dart';

class Category extends StatelessWidget {
  final String category;

  const Category({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Results(
                  category: category,
                ),
              ),
            );
          },
          child: Ink(
            child: Center(
              child: Image.asset("$imagePath$category.png"),
            ),
          ),
        ),
        Text(categories[category]!),
      ],
    );
  }
}
