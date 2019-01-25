import 'package:flutter/material.dart';
import '../account_manager.dart';
import '../category_manager.dart';
import '../models/account.dart';
import '../models/category.dart';

class HomePage extends StatelessWidget{
  final List<Account> accounts;
  final List<Category> categories;

  HomePage(this.accounts,this.categories);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      //TAB TOP PAGE
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          textTheme: TextTheme(title: TextStyle(color: Colors.white, fontSize: 20.0)),
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
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: <Widget>[
              Tab(
                text: 'ACCOUNTS',
              ),
              Tab(
                text: 'CATEGORIES',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            AccountManger(accounts),
            CategoryManger(categories),
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