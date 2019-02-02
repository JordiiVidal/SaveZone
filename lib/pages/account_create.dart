import 'package:flutter/material.dart';
import '../models/account.dart';
import '../models/service.dart';

class AccountCreatePage extends StatefulWidget {
  final List<Service> services;
  final Function addAccount;

  AccountCreatePage(this.addAccount, this.services);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AccountCreatePage();
  }
}

class _AccountCreatePage extends State<AccountCreatePage> {
  String _service;
  String _accountValue;
  String _emailValue;
  String _passwordValue;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Container(
              child: null,
              height: 50.0,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/lock.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            TextField(
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Account Name',
              ),
              onChanged: (String value) {
                setState(() {
                  _accountValue = value;
                });
              },
            ),
            TextField(
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  color: Colors.black),
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (String value) {
                setState(() {
                  _emailValue = value;
                });
              },
            ),
            TextField(
              obscureText: true,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  color: Colors.black),
              decoration: InputDecoration(labelText: 'Password'),
              onChanged: (String value) {
                setState(() {
                  _passwordValue = value;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text(
                'SAVE',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                final Account account = new Account(
                    name: _accountValue,
                    email: _emailValue,
                    password: _passwordValue);
                widget.addAccount(account);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
