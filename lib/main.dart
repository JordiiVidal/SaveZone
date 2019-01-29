import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/account_create.dart';
import 'models/account.dart';
import 'models/category.dart';

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
  List<Category> _categories = [];
  
  var c = Category(name: 'Gmail',icon: Icons.message,colors: Colors.blue);

  void _addAccount(Account account){
    setState(() {
          _accounts.add(account);
          _categories.add(c);
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
        title: 'SaveZone',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.lightBlueAccent,
          accentColor: Colors.blue,
          backgroundColor: Colors.white,
        ),
        routes: {
          '/': (BuildContext context) => HomePage(_accounts,_categories),
        },onGenerateRoute: (RouteSettings settings){
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
          return null; //invalid name por lo tanto no va hacer load de una nueva page
          }
          if (pathElements[1] == 'account') {
            return MaterialPageRoute(builder : (BuildContext context) => AccountCreatePage(_addAccount));
          }
        },onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) => HomePage(_accounts,_categories));
      },
      );
    }

}


