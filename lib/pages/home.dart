import 'package:flutter/material.dart';
import '../account_manager.dart';

class HomePage extends StatelessWidget{
  final List<Map<String,dynamic>> accounts;

  HomePage(this.accounts);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      //TAB TOP PAGE
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('SaveZone'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.lock_outline),
              tooltip: 'block mobile',
              onPressed: (){},
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.new_releases),
                text: 'My Accounts',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'Categories',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            AccountManger(accounts),
            AccountManger(accounts),
          ],
        ),
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.pushNamed(context, '/account');
        }
      ),
        //bottomNavigationBar: TabBar(tabs: <Widget>[Tab(text: 'sdad',),Tab(text: 'sas',)],),
      ),
    );
  }
}