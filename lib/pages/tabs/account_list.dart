import 'package:flutter/material.dart';
import '../../models/account.dart';
import '../../accounts.dart';

class AccountList extends StatelessWidget {
  final List<Account> _accounts;
  final Function _deleteAccount;

  AccountList(this._accounts, this._deleteAccount);

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
              Container(
                color: Theme.of(context).primaryColor,
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    child: Row(
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
                    ),
                    transform: Matrix4.translationValues(0.0, 25.0, 0.0),
                  ),
                ]),
              ),
              SizedBox(
                    height: 10.0,
                  ),
              Expanded(
                child: Accounts(_accounts, _deleteAccount),
              )
            ],
          );
  }
}
