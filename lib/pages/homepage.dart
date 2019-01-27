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
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          textTheme: TextTheme(title: TextStyle(color: Colors.white, fontSize: 20.0)),
          title: Text('SAFE ZONE',style: TextStyle(fontSize: 20.0,letterSpacing: 1.5)),
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.lock_outline),
              tooltip: 'block mobile',
              onPressed: (){},
            ),
            IconButton(
              icon: new Icon(Icons.delete_forever),
              tooltip: 'block mobile',
              onPressed: (){},
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: <Widget>[
              Tab(
                child: Text('ACCOUNTS',style: TextStyle(fontSize: 12.0,letterSpacing: 1.5)),
              ),
              Tab(
                child: Text('CATEGORIES',style: TextStyle(fontSize: 12.0,letterSpacing: 1.5)),
              ),Tab(
                child: Text('HELP',style: TextStyle(fontSize: 12.0,letterSpacing: 1.5)),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            AccountManger(accounts),
            CategoryManger(categories),
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