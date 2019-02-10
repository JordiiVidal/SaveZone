import 'package:flutter/material.dart';
import 'accounts.dart';
import 'models/account.dart';

class AccountManger extends StatelessWidget {
  final List<Account> _accounts;
  AccountManger(this._accounts);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _accounts.length <= 0
        ? Center(
            child: FloatingActionButton.extended(
              heroTag: Key('_fabAccount'),
              icon: Icon(Icons.add),
              label: Text('Añadir Cuenta'),
              onPressed: () {
                Navigator.pushNamed(context, '/account');
              },
            ),
          )
        : Column(
            children: <Widget>[
              Expanded(
                child: Accounts(_accounts),
              )
            ],
          );
  }
}
