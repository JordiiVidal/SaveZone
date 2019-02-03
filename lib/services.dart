import 'package:flutter/material.dart';
import 'models/service.dart';

class Services extends StatelessWidget {
  final List<Service> _services;

  Services(this._services);

  Widget _buildServiceItem(BuildContext context, int index) {
    return ListTile(
      title: Text(
        _services[index].name,
        style: TextStyle(color: Colors.grey[600]),
      ),
      trailing: 
        Icon(_services[index].icon),
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
