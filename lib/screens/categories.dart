import 'package:flutter/material.dart';
import 'package:hyrule/screens/components/categories.dart';
import 'package:hyrule/utils/consts/categories.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Escolha uma categoria"),
          centerTitle: true,
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          children: categories.keys.map((e) => Category(category: e)).toList(),
        ),
      ),
    );
  }
}
