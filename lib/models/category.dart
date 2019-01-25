import 'package:flutter/material.dart';
import 'account.dart';

class Category{
  
  final String name;
  final Icon icon;
  final String type;
  final Colors colors;
  final List<Account> list;

  Category({@required this.name, @required this.icon, @required this.type,@required this.colors, @required this.list,});

}