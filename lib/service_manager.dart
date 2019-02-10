import 'package:flutter/material.dart';
import 'services.dart';
import 'models/service.dart';

class ServiceManger extends StatelessWidget {
  final List<Service> _services;
  ServiceManger(this._services);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _services.length <= 0
        ? Center(
            child: FloatingActionButton.extended(
              heroTag: Key('_fabService'),
              icon: Icon(Icons.add),
              label: Text('Añadir Servicios'),
              onPressed: () {
                Navigator.pushNamed(context, '/service');
              },
            ),
          )
        : Container(
            alignment: Alignment.topCenter,
            child: Services(_services),
          );
  }
}
