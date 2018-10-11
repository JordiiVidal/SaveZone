import 'package:flutter/material.dart';


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
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  child: Text('SAVE'),
                  color: Theme.of(context).accentColor,
                  onPressed: (){
                    final Map<String, dynamic> account = {
                      'account': _accountValue,
                      'email': _emailValue,
                      'icon' : Icons.email
                    };
                    widget.addAccount(account);
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ],
            ),
          ),
        );
    }
}