import 'package:flutter/material.dart';
import 'services.dart';
import 'models/service.dart';

class ServiceManger extends StatelessWidget {
  final List<Service> services;
  ServiceManger(this.services);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.topCenter,
      child: Services(services),
      height: 400.0,
    );
  }
}
