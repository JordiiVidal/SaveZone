import 'package:flutter/material.dart';
import 'accounts.dart';
import 'models/account.dart';

class AccountManger extends StatelessWidget{
  final List<Account> accounts;
  AccountManger(this.accounts);

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Column(
        children: <Widget>[
          Expanded(
            child: Accounts(accounts),
          )
        ],
      );
    }
}