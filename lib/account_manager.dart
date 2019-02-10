import 'package:flutter/material.dart';
import 'accounts.dart';
import 'models/account.dart';

class AccountManger extends StatelessWidget {
  final List<Account> _accounts;
  final Function _deleteAccount;
  AccountManger(this._accounts, this._deleteAccount);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _accounts.length <= 0
        ? Center(
            child: FloatingActionButton.extended(
              heroTag: Key('_fabAccount1'),
              icon: Icon(Icons.add),
              label: Text('Añadir Cuenta'),
              onPressed: () {
                Navigator.pushNamed(context, '/account');
              },
            ),
          )
        : Column(
            children: <Widget>[
              SafeArea(
                child: Column( children: <Widget>[SizedBox(height: 10.0,), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FloatingActionButton.extended(
                      heroTag: Key('_fabAccount2'),
                      label: Text('Añadir Cuenta'),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Navigator.pushNamed(context, '/account');
                      },
                      backgroundColor: Theme.of(context).accentColor,
                    )
                  ],
                )]
              ),)
,              Expanded(
                child: Accounts(_accounts, _deleteAccount),
              )
            ],
          );
  }
}
