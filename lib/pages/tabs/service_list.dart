import 'package:flutter/material.dart';
import '../../models/service.dart';
import '../../service_manager.dart';

class ServiceList extends StatelessWidget {
  final List<Service> services;

  ServiceList(this.services);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ServiceManger(services);
  }
}
