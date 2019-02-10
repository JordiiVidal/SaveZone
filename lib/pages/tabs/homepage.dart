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
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey[300])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.red,
                ),
                Center(child: Text('sasa'),),
                Text('45')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
