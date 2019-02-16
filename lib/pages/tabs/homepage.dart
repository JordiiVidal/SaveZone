import 'package:flutter/material.dart';
import '../../models/account.dart';
import '../../models/service.dart';

class HomePage extends StatelessWidget {
  final List<Account> accounts;
  final List<Service> services;

  HomePage(this.accounts, this.services);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('SAFEZONE',style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.0,
                  ),)
                ],
              ),
            ),
            height: 44.0,
          ),
          Expanded(
            child: Center(child:Text('HOME PAGE')),
          ),
        ],
      ),
    );
  }
}
