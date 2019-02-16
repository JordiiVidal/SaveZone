import 'package:flutter/material.dart';
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
  String _nameService;
  IconData _icon;
  int _color;

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  Widget _iconBuild() {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.chat),
            padding: EdgeInsets.all(10.0),
            onPressed: () {
              setState(() {
                _icon = Icons.chat;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.email),
            padding: EdgeInsets.all(10.0),
            onPressed: () {
              setState(() {
                _icon = Icons.email;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.videogame_asset),
            padding: EdgeInsets.all(10.0),
            onPressed: () {
              setState(() {
                _icon = Icons.videogame_asset;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.camera),
            padding: EdgeInsets.all(10.0),
            onPressed: () {
              setState(() {
                _icon = Icons.camera;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.shop),
            padding: EdgeInsets.all(10.0),
            onPressed: () {
              setState(() {
                _icon = Icons.shop;
              });
            },
          )
        ],
      ),
    );
  }

  Widget _colorBuild() {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _color = getColorHexFromStr('#f7f7f7');
              });
            },
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20.0),
                color: Color(
                  getColorHexFromStr('#f7f7f7'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _color = getColorHexFromStr('#9ebcf5');
              });
            },
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(
                  getColorHexFromStr('#9ebcf5'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _color = getColorHexFromStr('#f59e9e');
              });
            },
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(
                  getColorHexFromStr('#f59e9e'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _color = getColorHexFromStr('#a8f59e');
              });
            },
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(
                  getColorHexFromStr('#a8f59e'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        title: Text('Create Service'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: _color == null
                    ? Theme.of(context).accentColor
                    : Color(_color),
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).primaryColorLight, width: 1.0
                  ),
                  left: BorderSide(
                   color: Theme.of(context).primaryColorLight, width: 1.0
                  ),
                  top: BorderSide(
                    color: Theme.of(context).primaryColorLight, width: 1.0
                  ),
                  right: BorderSide(
                      color: Theme.of(context).accentColor, width: 8.0),
                ),
              ),
              margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
              child: ListTile(
                title: Text(
                  _nameService == null ? 'Nombre' : _nameService,
                ),
                trailing: Icon(
                  _icon == null ? Icons.phone_android : _icon,
                ),
                onTap: () => {},
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
                    _nameService = value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('ICONO'),
            ),
            _iconBuild(),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('COLOR'),
            ),
            _colorBuild(),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Text(
                    'Guardar',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        letterSpacing: 1.0),
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    final Service service =
                        Service(name: _nameService, color: '#000', icon: 1);
                    widget.addService(service);
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
