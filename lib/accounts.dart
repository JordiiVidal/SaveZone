import 'package:flutter/material.dart';
import 'models/account.dart';

class Accounts extends StatelessWidget {
  final List<Account> _accounts;

  Accounts(this._accounts);

  void showSnackBar(BuildContext context, Account account) {
    var snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('Se ha eliminado la cuenta '+account.name),
          Icon(Icons.email)
        ],
      ),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  Widget _buildAccountItem(BuildContext context, int index) {
    return Dismissible(
      key: Key(_accounts[index].name),
      background: Container(
        child: Icon(
          Icons.access_alarm,
        ),
        color: Colors.blue,
        padding: EdgeInsets.only(right: 250.0),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 250.0),
      ),
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          
          showSnackBar(context,_accounts[index]);
        }
        if (direction == DismissDirection.startToEnd) {
          print('startend');
        }
        if (direction == DismissDirection.horizontal) {
          print('horitzontal');
        }
      },
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.storage),
            title: Text(_accounts[index].name),
            subtitle: Text(_accounts[index].email),
            trailing: Text(
              _accounts[index].name[0].toUpperCase(),
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300),
            ),
          ),
          Divider(),
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
