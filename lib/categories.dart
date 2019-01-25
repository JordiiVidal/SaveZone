import 'package:flutter/material.dart';
import 'models/category.dart';

class Categories extends StatelessWidget{

  final List<Category>_categories;

  Categories(this._categories);

  Widget _buildAccountItem(BuildContext context, int index){
    return Card(
      color: Colors.redAccent,
      child: Column(
        children: <Widget>[
          
        ],
      ),
    );
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container();
    }
}