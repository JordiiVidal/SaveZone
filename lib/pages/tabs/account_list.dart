import 'package:flutter/material.dart';
import '../../models/account.dart';
import '../../account_manager.dart';


class AccountList extends StatefulWidget{

  final List<Account> accounts;


  AccountList(this.accounts);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AccountListState();
  }

}

class AccountListState extends State<AccountList>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AccountManger(widget.accounts);
  }
}