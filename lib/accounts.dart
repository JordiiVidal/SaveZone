import 'package:flutter/material.dart';
import 'models/account.dart';

class Accounts extends StatelessWidget {
  final List<Account> _accounts;

  Accounts(this._accounts);

  Widget _buildAccountItem(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.all(15.0),
      color: Colors.white,
      shape: new BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        side: BorderSide(color: Colors.black12)
      ),
      child: Column(
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.storage),
              title: Text(_accounts[index].name),
              subtitle: Text(_accounts[index].email),
              trailing: Text(_accounts[index].name[0]),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0))
        ],
      ),
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
