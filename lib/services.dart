import 'package:flutter/material.dart';
import 'models/service.dart';

class Services extends StatelessWidget {
  final List<Service> _services;

  Services(this._services);

  Widget _buildServiceItem(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      decoration: BoxDecoration(
        border: BorderDirectional(
            bottom:
                BorderSide(color: Colors.grey[300], width: 1.0)),
      ),
      child: ListTile(
        title: Text(
          _services[index].name,
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: Icon(Icons.email),//_services[index].icon
      ),
    );
  }

  Widget _builServicesList() {
    Widget serviceCard = ListView.builder(
      shrinkWrap: true,
      itemBuilder: _buildServiceItem,
      itemCount: _services.length,
    );

    return serviceCard;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _builServicesList();
  }
}
