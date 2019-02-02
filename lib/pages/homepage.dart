import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../account_manager.dart';
import '../service_manager.dart';
import '../models/account.dart';
import '../models/service.dart';

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
              /*image: DecorationImage(
                    image: ExactAssetImage('assets/lock.jpg'),
                    fit: BoxFit.cover,
                  ),*/
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
          Divider(),
          Container(
            color: Colors.blueGrey,
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Cerrar',
                  style: TextStyle(color: Colors.white),
                ),
                CloseButton()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _fabBuild() {}

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
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, '/service');
          }),
      //bottomNavigationBar: TabBar(tabs: <Widget>[Tab(text: 'sdad',),Tab(text: 'sas',)],),
    );
  }
}
