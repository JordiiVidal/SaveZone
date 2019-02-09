import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../account_manager.dart';
import '../service_manager.dart';
import '../models/account.dart';
import '../models/service.dart';
import '../utils/fancyfab.dart';

class HomePage extends StatefulWidget {
  final List<Account> accounts;
  final List<Service> services;

  HomePage(this.accounts, this.services);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  Widget _drawerBuild(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            color: Theme.of(context).primaryColor,
          ),
          ServiceManger(widget.services),
        ],
      ),
    );
  }

  Widget _bottomNavigation(
      BuildContext context, GlobalKey<ScaffoldState> scaffold, double width) {
    double padding = width / 8;
    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: padding,
                ),
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    scaffold.currentState.openDrawer();
                  },
                ),
                SizedBox(
                  width: padding,
                ),
                IconButton(
                  icon: Icon(
                    Icons.security,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/account');
                  },
                ),
              ],
            ),
          ),
          Container(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.business_center,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/service');
                  },
                ),
                SizedBox(
                  width: padding,
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: padding,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    double _widthDevice = MediaQuery.of(context).size.width;
    double _width_50 = _widthDevice * 0.50;

    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

    // TODO: implement build
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColorLight,
        drawer: _drawerBuild(context),
        body: AccountManger(widget.accounts),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/service');
          },
          child: Icon(
            Icons.home,
            size: 22.0,
          ),
          backgroundColor: Theme.of(context).accentColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:
            _bottomNavigation(context, _scaffoldKey, _width_50));
  }
}
