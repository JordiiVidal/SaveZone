import 'package:flutter/material.dart';
import '../../models/service.dart';
import '../../services.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class ServiceList extends StatefulWidget {
  final List<Service> _services;

  ServiceList(this._services);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ServiceListState();
  }
}

class ServiceListState extends State<ServiceList> {
  File jsonFile;
  Directory dir;
  String filename = "safezone.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;
  List<Service> _services = [];

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = File(dir.path + "/" + filename);
      fileExists = jsonFile.existsSync();
      if (fileExists) {
        setState(() {
          fileContent = json.decode(jsonFile.readAsStringSync());
          loop();
        });
      }
    });
  }

  void loop() {
    if (fileContent != null) {
      fileContent.forEach((k, v) {
        Service service = Service.fromJson(json.decode(v));
        _services.add(service);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _services.length <= 0
        ? SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  color: Theme.of(context).primaryColor,
                  height: 44.0,
                ),
                Expanded(
                  child: Center(
                    child: FloatingActionButton.extended(
                      heroTag: Key('_fabService'),
                      icon: Icon(Icons.add),
                      label: Text('Añadir Servicios'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/service');
                      },
                    ),
                  ),
                ),
              ],
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
