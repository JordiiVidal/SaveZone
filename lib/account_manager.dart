import 'package:flutter/material.dart';
import 'accounts.dart';

class AccountManger extends StatelessWidget{
  final List<Map<String,dynamic>> accounts;
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