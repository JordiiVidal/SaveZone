import 'dart:convert';
import 'dart:io';

import 'package:SafeZone/tools/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../models/account.dart';
import '../models/service.dart';

class AccountCreatePage extends StatefulWidget {
  final List<Service> services;
  final Function addAccount;

  AccountCreatePage(this.addAccount, this.services);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AccountCreatePage();
  }
}

class _AccountCreatePage extends State<AccountCreatePage> {
  Service _service;
  String _userNameValue;
  String _emailValue;
  String _passwordValue;

  Directory dir;

  File serviceFile;
  String filename = "services.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;
  List<Service> _services = [];

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      serviceFile = File(dir.path + "/" + filename);
      fileExists = serviceFile.existsSync();
      if (fileExists) {
        setState(() {
          fileContent = json.decode(serviceFile.readAsStringSync());
          loop();
        });
      }
    });
    
  }


  void loop() {
    if (fileContent != null) {
      fileContent.forEach((k, v) {
        Service service = Service.fromJson(json.decode(v));
        setState(() {
          _services.add(service);
        });
      });
    }
  }

  Widget _buildServiceItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _service = _services[index];
        });
      },
      child: Container(
        width: 100.0,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300], width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey[100],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            CircleAvatar(
              radius: 35.0,
              child: Text(
                _services[index].name[0].toUpperCase(),
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              backgroundColor: Colors.red, //color
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              _services[index].name,
              style: TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceList() {
    Widget serviceCard = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: _buildServiceItem,
      itemCount: _services.length,
    );

    return serviceCard;
  }

  Widget _btnAddService() {
    return Center(
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(21.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/service');
          },
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Theme.of(context).accentColor,
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Crear Cuenta'),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            child: Text('Selccionar Servicio',style: TextStyle(fontSize: 19.0,letterSpacing: 1.0,fontWeight: FontWeight.w400),),
            padding: EdgeInsets.all(20.0),
          ),
          Container(
            decoration: BoxDecoration(
              border: BorderDirectional(
                  top: BorderSide(color: Colors.grey[300], width: 0.5),
                  bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
                  color: Theme.of(context).accentColor.withOpacity(0.9)
            ),
            height: 180.0,
            padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
            child:
                _services.length == 0 ? _btnAddService() : _buildServiceList(),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
            child: TextField(
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  color: Colors.black),
              decoration: InputDecoration(
                labelText: 'User Name',
              ),
              onChanged: (String value) {
                setState(() {
                  _userNameValue = value;
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
            child: TextField(
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  color: Colors.black),
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (String value) {
                setState(() {
                  _emailValue = value;
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
            child: TextField(
              obscureText: true,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  color: Colors.black),
              decoration: InputDecoration(labelText: 'Password'),
              onChanged: (String value) {
                setState(() {
                  _passwordValue = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  color: Colors.red,
                ),
                width: 40.0,
                height: 10.0,
              ),
              Container(
                width: 80.0,
                height: 10.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  color: Colors.orange,
                ),
              ),
              Container(
                width: 120.0,
                height: 10.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  color: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
          Center(
            child: RaisedButton(
              child: Text(
                'Crear',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                final Account account = new Account(
                    userName: _userNameValue,
                    email: _emailValue,
                    password: _passwordValue,
                    service: _service);
                //writeToFile(account.email, account);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

