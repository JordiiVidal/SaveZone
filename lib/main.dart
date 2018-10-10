import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/account_create.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _MyAppState();
    }
}
class _MyAppState extends State<MyApp>{

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        title: 'SaveZone',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.lightBlueAccent,
          accentColor: Colors.lime,
          backgroundColor: Colors.white,
        ),
        routes: {
          '/': (BuildContext context) => HomePage(),
        },onGenerateRoute: (RouteSettings settings){
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
          return null; //invalid name por lo tanto no va hacer load de una nueva page
          }
          if (pathElements[1] == 'account') {
            return MaterialPageRoute(builder : (BuildContext context) => AccountCreatePage());
          }
        },onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      },
      );
    }

}


