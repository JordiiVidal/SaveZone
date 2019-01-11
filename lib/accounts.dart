import 'package:flutter/material.dart';
import 'models/account.dart';

class Accounts extends StatelessWidget{

  final List<Account>_accounts;

  Accounts(this._accounts);

  Widget _buildAccountItem(BuildContext context, int index){
    return Card(
      color: Colors.redAccent,
      child: Column(
        children: <Widget>[
          ListTile(
            //leading: Icon(_accounts[index]['icon']),
            title: Text(_accounts[index].name),
            subtitle: Text(_accounts[index].email),
          )
        ],
      ),
    );
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