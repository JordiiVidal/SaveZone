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
  static int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }
  List<Service> _services = [
    /*Service(name: 'Gmail', icon: Icons.email, color: getColorHexFromStr('#27851a')),
    Service(name: 'Facebook', icon: Icons.chat, color: getColorHexFromStr('#27851a')),
    Service(name: 'Instagram', icon: Icons.photo_camera, color: getColorHexFromStr('#27851a')),
    Service(name: 'Amazon', icon: Icons.shopping_cart, color: getColorHexFromStr('#27851a')),
    Service(name: 'Outlook', icon: Icons.email, color: getColorHexFromStr('#27851a'))*/
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
