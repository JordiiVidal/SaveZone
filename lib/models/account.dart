import 'package:flutter/material.dart';
import 'service.dart';

class Account{

  final String email;
  final String userName;
  final String password;
  final Service service;

  Account({ @required this.email, @required this.userName, @required this.password, @required this.service});

  factory Account.fromJson(Map<String, dynamic> parsedJson){
    return Account(
      email: parsedJson['email'],
      userName : parsedJson['userName'],
      password : parsedJson ['password'],
      service :Service.fromJson(parsedJson['service']),
    );
  }
  toJson(){

    Map<String, dynamic> serviceJosn = <String, dynamic>{
      "email":this.email,
      "userName":this.userName,
      "password":this.password,
      "service":this.service
    };

    return serviceJosn;
  }
}