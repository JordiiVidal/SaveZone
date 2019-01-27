import 'package:flutter/material.dart';
import 'models/account.dart';

class Accounts extends StatelessWidget {
  final List<Account> _accounts;

  Accounts(this._accounts);

  Widget _buildAccountItem(BuildContext context, int index) {
    return Column(
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.storage),
              title: Text(_accounts[index].name),
              subtitle: Text(_accounts[index].email),
              trailing: Text(_accounts[index].name[0].toUpperCase(),style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w300),),
              ),
              Divider(),
        ],
    );
  }

  Widget _buildAccountList() {
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
