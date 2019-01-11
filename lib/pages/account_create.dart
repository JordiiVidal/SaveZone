import 'package:flutter/material.dart';
import '../models/account.dart';


class AccountCreatePage extends StatefulWidget{

  final Function addAccount;

  AccountCreatePage(this.addAccount);

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _AccountCreatePage();
    }
}
class _AccountCreatePage extends State<AccountCreatePage>{
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
            margin: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Account Name',),
                  onChanged: (String value){
                    setState(() {
                      _accountValue = value;
                    });
                  },
                ),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (String value){
                    setState(() {
                      _emailValue = value;       
                    });
                  },
                ),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(labelText: 'Password'),
                  onChanged: (String value){
                    setState(() {
                      _passwordValue = value;       
                    });
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  child: Text('SAVE'),
                  color: Theme.of(context).accentColor,
                  onPressed: (){
                    final Account account = new Account(id: 1,name: _accountValue, email: _emailValue, password: _passwordValue);
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