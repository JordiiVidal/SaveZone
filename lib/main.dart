import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/account_create.dart';
import 'models/account.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _MyAppState();
    }
}
class _MyAppState extends State<MyApp>{

  List<Account> _accounts = [];
  
  void _addAccount(Account account){
    setState(() {
          _accounts.add(account);
          print(_accounts);
        });
  }
  void _deleteAccount(int index){
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
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[50] : Colors.blueAccent,
          accentColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[300] : Colors.blue,
          backgroundColor: Colors.white,
        ),
        routes: {
          '/': (BuildContext context) => HomePage(_accounts),
        },onGenerateRoute: (RouteSettings settings){
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
          return null; //invalid name por lo tanto no va hacer load de una nueva page
          }
          if (pathElements[1] == 'account') {
            return MaterialPageRoute(builder : (BuildContext context) => AccountCreatePage(_addAccount));
          }
        },onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) => HomePage(_accounts));
      },
      );
    }

}


