import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../account_manager.dart';
import '../../service_manager.dart';
import '../../models/account.dart';
import '../../models/service.dart';

class HomePage extends StatefulWidget {
  final List<Account> accounts;
  final List<Service> services;

  HomePage(this.accounts, this.services);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Center(child: Text('home'),);

    }
}
