import 'package:flutter/material.dart';
import 'serviceJSON.dart';

class AccountJSON{

  final String email;
  final String userName;
  final String password;
  final ServiceJSON service;

  AccountJSON({ @required this.email, @required this.userName, @required this.password, @required this.service});

  factory AccountJSON.fromJson(Map<String, dynamic> parsedJson){
    return AccountJSON(
      email: parsedJson['email'],
      userName : parsedJson['userName'],
      password : parsedJson ['password'],
      service :ServiceJSON.fromJson(parsedJson['service']),
    );
  }
}