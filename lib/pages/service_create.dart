import 'package:flutter/material.dart';
import '../models/service.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import '../tools/colors.dart';
import '../tools/lists.dart';

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
  File jsonFile;
  Directory dir;
  String filename = "safezone.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;
  String _nameService;
  IconData _icon;
  int indexIcon;
  int _color;
  List<IconData> _icons = [];

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = File(dir.path + "/" + filename);
      fileExists = jsonFile.existsSync();
    });
    _icons = iconlist();
  }

  File createFile(
      Map<String, dynamic> content, Directory dir, String filename) {
    //print('create');
    File file = File(dir.path + "/" + filename);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
    return file;
  }

  void writeToFile(String key, Service service) {
    //print('write');
    Map<String, dynamic> content = {key: json.encode(service.toJson())};
    if (fileExists) {
      print('file exists');
      Map<String, dynamic> jsonFileContent =
          json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      //print('File not exists');
      createFile(content, dir, filename);
    }
    setState(() {
      fileContent = json.decode(jsonFile.readAsStringSync());
    });
  }

  Widget _iconItem(BuildContext context, int index){
    return IconButton(
            icon: Icon(_icons[index]),
            padding: EdgeInsets.all(10.0),
            onPressed: () {
              setState(() {
                _icon = _icons[index];
                indexIcon = index;
              });
            },
          );
  }

  Widget _iconBuild() {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 50.0,
      child: ListView.builder( 
        scrollDirection: Axis.horizontal,
        itemBuilder: _iconItem,
        itemCount: _icons.length,
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
                      color: Theme.of(context).primaryColorLight, width: 1.0),
                  left: BorderSide(
                      color: Theme.of(context).primaryColorLight, width: 1.0),
                  top: BorderSide(
                      color: Theme.of(context).primaryColorLight, width: 1.0),
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
                        Service(name: _nameService, color: '#000', icon: indexIcon);
                    writeToFile(service.name, service);
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
