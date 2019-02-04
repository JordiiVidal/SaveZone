import 'package:flutter/material.dart';
import 'service.dart';

class Account{

  final String email;
  final String userName;
  final String password;
  final Service service;

  Account({ @required this.email, @required this.userName, @required this.password, @required this.service});

}