import 'package:flutter/material.dart';
import 'models/service.dart';

class Services extends StatelessWidget {
  final List<Service> _services;

  Services(this._services);

  Widget _buildCategoryCell(BuildContext context, int index) {
    return Card(
      child: GridTile(
        header: Text(_services[index].name),
        footer: Row(
          children: <Widget>[
            Icon(_services[index].icon)
          ],
        ),
      )
    );
  }

  Widget _builCategoriesGrid() {
    Widget accountCard = GridView.builder(
      itemBuilder: _buildCategoryCell,
      itemCount: _services.length,
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
