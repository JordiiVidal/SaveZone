import 'package:flutter/material.dart';
import 'models/account.dart';

class Accounts extends StatefulWidget {
  final List<Account> _accounts;
  final Function _deleteAccount;

  Accounts(this._accounts, this._deleteAccount);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AccountsState();
  }
}

class AccountsState extends State<Accounts> {
  void showSnackBar(BuildContext context) {
    var snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('Se ha eliminado la cuenta'),
          Icon(Icons.email)
        ],
      ),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  Widget _buildAccountItem(BuildContext context, int index) {
    return Dismissible(
      key: Key(widget._accounts[index].userName),
      background: Container(
        color: Theme.of(context).accentColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        padding: EdgeInsets.only(right: 250.0),
      ),
      secondaryBackground: Container(
        color: Theme.of(context).accentColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 250.0),
      ),
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          setState(() {
            widget._deleteAccount(index);
          });

          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("dismissed")));
        }
        if (direction == DismissDirection.startToEnd) {
          setState(() {
            widget._deleteAccount(index);
          });

          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("dismissed")));
        }
      },
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(widget._accounts[index].service.icon),
            title: Text(widget._accounts[index].email),
            subtitle: Text(widget._accounts[index].service.name),
            trailing: Text(
              widget._accounts[index].service.name[0].toUpperCase(),
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
      itemCount: widget._accounts.length,
    );

    return accountCard;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildAccountList();
  }
}
