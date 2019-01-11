import 'package:flutter/material.dart';
import 'account.dart';

class Category{
  
  final String name;
  final String image;
  final String type;
  final List<Account> list;

  Category({@required this.name, @required this.image, @required this.type, @required this.list});

}