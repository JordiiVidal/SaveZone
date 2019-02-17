import 'package:flutter/material.dart';

class Service{
  
  final String name;
  final int icon;
  final String color;

  Service({@required this.name, @required this.icon,@required this.color});

  factory Service.fromJson(Map<String, dynamic> parsedJson){
    return Service(
      name: parsedJson['name'],
      icon : parsedJson['icon'],
      color : parsedJson ['color']
    );
  }

  toJson(){

    Map<String, dynamic> serviceJosn = <String, dynamic>{
      "name":this.name,
      "icon":this.icon,
      "color":this.color,
    };

    return serviceJosn;
  }
}