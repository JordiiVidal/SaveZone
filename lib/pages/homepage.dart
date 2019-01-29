import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../account_manager.dart';
import '../models/account.dart';

class HomePage extends StatelessWidget {
  final List<Account> accounts;

  HomePage(this.accounts);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      //TAB TOP PAGE
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation:
              defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
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
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/lock.jpg'),
                    fit: BoxFit.cover,
                  ),
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
              Container(
                height: 320.0,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Gmail',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      trailing: Icon(
                        Icons.email,
                        size: 19.0,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Facebook',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      trailing: Icon(
                        Icons.chat,
                        size: 19.0,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Amazon',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      trailing: Icon(
                        Icons.card_giftcard,
                        size: 19.0,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Epic Games',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      trailing: Icon(
                        Icons.videogame_asset,
                        size: 19.0,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'OutLook',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      trailing: Icon(
                        Icons.email,
                        size: 19.0,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text('Cerrar'),CloseButton()],
                ),
              ),
            ],
          ),
        ),
        body: AccountManger(accounts),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
            onPressed: () {
              Navigator.pushNamed(context, '/account');
            }),
        //bottomNavigationBar: TabBar(tabs: <Widget>[Tab(text: 'sdad',),Tab(text: 'sas',)],),
      ),
    );
  }
}
