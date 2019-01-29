import 'package:flutter/material.dart';
import 'models/category.dart';

class Categories extends StatelessWidget {
  final List<Category> _categories;

  Categories(this._categories);

  Widget _buildCategoryCell(BuildContext context, int index) {
    return Card(
      child: GridTile(
        header: Text(_categories[index].name),
        footer: Row(
          children: <Widget>[
            Icon(_categories[index].icon)
          ],
        ),
      )
    );
  }

  Widget _builCategoriesGrid() {
    Widget accountCard = GridView.builder(
      itemBuilder: _buildCategoryCell,
      itemCount: _categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (2),
      ),
    );

    return accountCard;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _builCategoriesGrid();
  }
}
