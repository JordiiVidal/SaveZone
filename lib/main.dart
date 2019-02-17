import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/mainpage.dart';
import 'pages/account_create.dart';
import 'pages/service_create.dart';
import 'models/account.dart';
import 'models/service.dart';
import './tools/colors.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Account> _accounts = [];
  List<Service> _services = [];

  List<String> _colors = ['#f59e9e', '#a8f59e', '#9ebcf5', '#f7f7f7'];

  void _addService(Service service) {
    setState(() {
      _services.add(service);
      print(_services);
    });
  }

  void _deleteService(int index) {
    setState(() {
      _services.removeAt(index);
      print(_services);
    });
  }

  void _addAccount(Account account) {
    setState(() {
      _accounts.add(account);
      print(_accounts);
    });
  }

  void _deleteAccount(int index) {
    setState(() {
      _accounts.removeAt(index);
      print(_accounts);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Color(getColorHexFromStr('#2d3436'))),
      );
    }
    // TODO: implement build
    return MaterialApp(
      title: 'SafeZone',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS
            ? Colors.grey[850]
            : Color(getColorHexFromStr('#2d3436')),
        accentColor: defaultTargetPlatform == TargetPlatform.iOS
            ? Colors.grey[300]
            : Color(getColorHexFromStr('#b81132')),
        indicatorColor: Color(getColorHexFromStr('#b81132')),
        primaryColorLight: Color(getColorHexFromStr('#efefef')),
        primaryColorDark: Color(getColorHexFromStr('#121516')),
        backgroundColor: Colors.white,
      ),
      routes: {
        '/': (BuildContext context) =>
            MainPage(_accounts, _services, _deleteAccount),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null; //invalid name por lo tanto no va hacer load de una nueva page
        }
        if (pathElements[1] == 'account') {
          return MaterialPageRoute(
              builder: (BuildContext context) =>
                  AccountCreatePage(_addAccount, _services));
        }
        if (pathElements[1] == 'service') {
          return MaterialPageRoute(
              builder: (BuildContext context) =>
                  ServiceCreatePage(_addService));
        }
        if (pathElements[1] == 'main') {
          return MaterialPageRoute(
              builder: (BuildContext context) =>
                  MainPage(_accounts, _services, _deleteAccount));
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                MainPage(_accounts, _services, _deleteAccount));
      },
    );
  }
}
