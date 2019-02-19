import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../../models/account.dart';
import '../../accounts.dart';

class AccountList extends StatefulWidget {
  final List<Account> _accounts;
  final Function _deleteAccount;

  AccountList(this._accounts, this._deleteAccount);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AccountListState();
  }
}
class AccountListState extends State<AccountList> {

  File jsonFile;
  Directory dir;
  String filename = "accounts.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;
  List<Account> _accounts = [];

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
        Account service = Account.fromJson(json.decode(v));
        _accounts.add(service);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _accounts.length <= 0
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
                      heroTag: Key('_fabAccount1'),
                      icon: Icon(Icons.add),
                      label: Text('Añadir Cuenta'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/account');
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
                          label: Text('Añadir Cuenta'),
                          icon: Icon(Icons.add),
                          onPressed: () {
                            Navigator.pushNamed(context, '/account');
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
                child: Accounts(_accounts, widget._deleteAccount),
              )
            ],
          );
  }
}
