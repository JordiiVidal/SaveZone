import 'package:flutter/material.dart';
import '../../models/account.dart';
import '../../account_manager.dart';


class AccountList extends StatelessWidget{

  final List<Account> accounts;
  final Function deleteAccount;


  AccountList(this.accounts,this.deleteAccount);

 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  AccountManger(accounts,deleteAccount);
  }

}
