import 'package:flutter/material.dart';
import '../models/account.dart';
import '../models/service.dart';

class ServiceCreatePage extends StatefulWidget {
  final Function addService;

  ServiceCreatePage(this.addService);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ServiceCreatePage();
  }
}

class _ServiceCreatePage extends State<ServiceCreatePage> {
  String _service;
  String _nameValue;
  Icon _icon;
  CircleAvatar _color;
  List<Icon> icons = <Icon>[
    const Icon(Icons.add_a_photo),
    const Icon(Icons.dashboard),
    const Icon(Icons.gamepad),
  ];
  List<CircleAvatar> colors = <CircleAvatar>[
    const CircleAvatar(
      backgroundColor: Colors.red,
    ),
    const CircleAvatar(
      backgroundColor: Colors.blue,
    )
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Service'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              child: null,
              height: 50.0,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/lock.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Service Name',
                ),
                onChanged: (String value) {
                  setState(() {
                    _nameValue = value;
                  });
                },
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  DropdownButton<Icon>(
                    isDense: true,
                    hint: Text('Seleccionar Icono'),
                    items: icons.map((Icon icon) {
                      return DropdownMenuItem<Icon>(
                        value: icon,
                        child: icon,
                      );
                    }).toList(),
                    onChanged: (Icon icon) {
                      setState(() {
                        if (icon != _icon) {
                          _icon = icon;
                        }
                      });
                    },
                    value: _icon == null ? null : _icon,
                  ),
                  DropdownButton<CircleAvatar>(
                    isDense: true,
                    onChanged: (CircleAvatar color) {
                      setState(() {
                        _color = color;
                      });
                    },
                    hint: Text('Seleccionar Color'),
                    value: _color == null ? null : _color,
                    items: colors.map((CircleAvatar color) {
                      return DropdownMenuItem<CircleAvatar>(
                        value: color,
                        child: color,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text(
                'SAVE',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                final Service service = Service(
                  name: _nameValue,
                );
                widget.addService(service);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
