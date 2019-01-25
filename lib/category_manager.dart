import 'package:flutter/material.dart';
import 'categories.dart';
import 'models/category.dart';

class   CategoryManger extends StatelessWidget{

  final List<Category> categories;
  CategoryManger(this.categories);

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Column(
        children: <Widget>[
          Expanded(
            child: Categories(categories),
          )
        ],
      );
    }
}