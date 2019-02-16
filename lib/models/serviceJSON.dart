import 'package:flutter/material.dart';

class ServiceJSON{
  
  final String name;
  final int icon;
  final String color;

  ServiceJSON({@required this.name, @required this.icon,@required this.color});

  factory ServiceJSON.fromJson(Map<String, dynamic> parsedJson){
    return ServiceJSON(
      name: parsedJson['name'],
      icon : parsedJson['icon'],
      color : parsedJson ['color']
    );
  }
}