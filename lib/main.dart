import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/account_create.dart';
import 'pages/service_create.dart';
import 'models/account.dart';
import 'models/service.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  List<Account> _accounts = [];
  List<Service> _services = [
    Service(name: 'Gmail', icon: Icon(Icons.email), colors: Colors.red),
    Service(name: 'Facebook', icon: Icon(Icons.chat), colors: Colors.blue),
    Service(name: 'Instagram', icon: Icon(Icons.photo_camera), colors: Colors.brown),
    Service(name: 'Amazon', icon: Icon(Icons.shopping_cart), colors: Colors.yellow),
    Service(name: 'Outlook', icon: Icon(Icons.email), colors: Colors.blue)
  ];

  void _addService(Service service) {
    setState(() {
      _services.add(service);
      print(_services);
    });
  }

  void _deleteService(int index) {
    setState(() {
      _services.removeAt(index);
      print(_services);
    });
  }

  void _addAccount(Account account) {
    setState(() {
      _accounts.add(account);
      print(_accounts);
    });
  }

  void _deleteAccount(int index) {
    setState(() {
      _accounts.removeAt(index);
      print(_accounts);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'SafeZone',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS
            ? Colors.grey[50]
            : Colors.blueAccent,
        accentColor: defaultTargetPlatform == TargetPlatform.iOS
            ? Colors.grey[300]
            : Colors.blue,
        backgroundColor: Colors.white,
      ),
      routes: {
        '/': (BuildContext context) => HomePage(_accounts,_services),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null; //invalid name por lo tanto no va hacer load de una nueva page
        }
        if (pathElements[1] == 'account') {
          return MaterialPageRoute(
              builder: (BuildContext context) =>
                  AccountCreatePage(_addAccount,_services));
        }
        if (pathElements[1] == 'service') {
          return MaterialPageRoute(
              builder: (BuildContext context) =>
                  ServiceCreatePage(_addService));
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => HomePage(_accounts,_services));
      },
    );
  }
}
