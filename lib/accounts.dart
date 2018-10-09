import 'package:flutter/material.dart';

class Accounts extends StatelessWidget{

  final Map<String,dynamic> _account = {
    'account':'Gmail',
    'user':'jordi',
    'email':'jordividal@gmail.com',
    'pswd':'12132',
    'icon':Icons.email
  };
  final List<Map<String,dynamic>>_accounts = [];

  Widget _buildAccountItem(BuildContext context, int index){
    return Card(
      color: Colors.redAccent,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(_accounts[index]['icon']),
            title: Text(_accounts[index]['account']),
            subtitle: Text(_accounts[index]['email']),
          )
        ],
      ),
    );
  }
  Accounts(){
    this._accounts.add(this._account);
  }

  Widget _buildAccountList(){

    Widget accountCard = ListView.builder(
      itemBuilder: _buildAccountItem,
      itemCount: _accounts.length,
    );

    return accountCard;
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return _buildAccountList();
    }
}