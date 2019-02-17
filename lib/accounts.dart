import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/account.dart';

class Accounts extends StatefulWidget {
  final List<Account> _accounts;
  final Function _deleteAccount;

  Accounts(this._accounts, this._deleteAccount);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AccountsState();
  }
}

class AccountsState extends State<Accounts> {
  
  void initState() {
    super.initState();
    _loadAccounts();
  }


  Future<String> _loadAccountAsset() async {
    return await rootBundle.loadString('assets/data/accounts.json');
  }

  Future<List<Account>> _loadAccounts() async {
    String jsonString = await _loadAccountAsset();
    print(jsonString);
    final jsonRespone = json.decode(jsonString);
    print(jsonRespone);
    List<Account> accounts = [];

    for (var a in jsonRespone) {
      Account accountJSON = Account.fromJson(a);
      accounts.add(accountJSON);
    }

    return accounts;
  }

  Widget _buildAccountList() {
    Widget accountCard = FutureBuilder(
      future: _loadAccounts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
              child: Center(
            child: Text('Loading ...'),
          ));
        } else {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(snapshot.data[index].userName),
                background: Container(
                  color: Theme.of(context).indicatorColor,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(right: 250.0),
                ),
                secondaryBackground: Container(
                  color: Theme.of(context).indicatorColor,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(left: 250.0),
                ),
                onDismissed: (DismissDirection direction) {
                  if (direction == DismissDirection.endToStart) {
                    setState(() {
                      widget._deleteAccount(index);
                    });

                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text("dismissed")));
                  }
                  if (direction == DismissDirection.startToEnd) {
                    setState(() {
                      widget._deleteAccount(index);
                    });

                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text("dismissed")));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(2.0)),
                  child: ListTile(
                    leading: Icon(Icons
                        .local_activity), // Icon(widget._accounts[index].service.icon)
                    title: Text(snapshot.data[index].email),
                    subtitle: Text(snapshot.data[index].service.name),
                    trailing: Text(
                      snapshot.data[index].service.name[0].toUpperCase(),
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              );
            },
            itemCount: snapshot.data.length,
          );
        }
      },
    );

    return accountCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildAccountList();
  }
}
