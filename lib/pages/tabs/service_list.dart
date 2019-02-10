import 'package:flutter/material.dart';
import '../../models/service.dart';
import '../../service_manager.dart';


class ServiceList extends StatefulWidget{

  final List<Service> services;

  ServiceList(this.services);

  @override
  State<StatefulWidget> createState() {
    
    // TODO: implement createState
    return _ServiceListState();
  }

}

class _ServiceListState extends State<ServiceList>{

  @override
  Widget build(BuildContext context) {
    
    return ServiceManger(widget.services);
  }

}