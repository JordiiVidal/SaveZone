import 'package:flutter/material.dart';
import 'pages/home.dart';

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
        },onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      },
      );
    }

}


