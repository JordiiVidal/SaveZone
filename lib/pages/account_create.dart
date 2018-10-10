import 'package:flutter/material.dart';
import 'dart:async';

class AccountCreatePage extends StatelessWidget{

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
                  //onChanged: (){},
                ),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(labelText: 'Email'),
                  //onChanged: ,
                ),
              ],
            ),
          ),
        );
    }
}