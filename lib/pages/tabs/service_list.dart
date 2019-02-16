import 'package:flutter/material.dart';
import '../../models/service.dart';
import '../../services.dart';

class ServiceList extends StatelessWidget {
  final List<Service> _services;

  ServiceList(this._services);

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
        : Column(
            children: <Widget>[
              Container(
                color: Theme.of(context).primaryColor,
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton.extended(
                          heroTag: Key('_fabAccount2'),
                          label: Text('Añadir Servicio'),
                          icon: Icon(Icons.add),
                          onPressed: () {
                            Navigator.pushNamed(context, '/service');
                          },
                          backgroundColor: Theme.of(context).accentColor,
                        )
                      ],
                    ),
                    transform: Matrix4.translationValues(0.0, 25.0, 0.0),
                  ),
                ]),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Services(_services),
              )
            ],
          );
  }
}
