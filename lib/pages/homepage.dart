import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../account_manager.dart';
import '../service_manager.dart';
import '../models/account.dart';
import '../models/service.dart';
import '../utils/fancyfab.dart';

class HomePage extends StatelessWidget {
  final List<Account> accounts;
  final List<Service> services;

  HomePage(this.accounts, this.services);

  Widget _drawerBuild() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            accountName: Text('Jordi'),
            accountEmail: Text('jordividal1997@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'J',
                style: TextStyle(fontSize: 29.0),
              ),
            ),
          ),
          ServiceManger(services),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        backgroundColor: Colors.blueAccent,
        textTheme:
            TextTheme(title: TextStyle(color: Colors.white, fontSize: 20.0)),
        title: Text('SAFE ZONE',
            style: TextStyle(fontSize: 20.0, letterSpacing: 1.5)),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.star_border),
            color: Colors.white,
            iconSize: 24.0,
            highlightColor: Colors.redAccent,
            tooltip: 'block mobile',
            onPressed: () {},
          )
        ],
      ),
      drawer: _drawerBuild(),
      body: AccountManger(accounts),
      floatingActionButton:FancyFab(),
      //bottomNavigationBar: TabBar(tabs: <Widget>[Tab(text: 'sdad',),Tab(text: 'sas',)],),
    );
  }
}
