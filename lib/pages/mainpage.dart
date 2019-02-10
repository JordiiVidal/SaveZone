import 'package:flutter/material.dart';
import '../service_manager.dart';
import '../models/account.dart';
import '../models/service.dart';
import '../pages/tabs/homepage.dart';
import '../pages/tabs/service_list.dart';
import '../pages/tabs/account_list.dart';

class MainPage extends StatefulWidget {
  final List<Account> accounts;
  final List<Service> services;
  final Function deleteAccount;

  MainPage(this.accounts, this.services,this.deleteAccount);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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

  Widget _fab() {
    return FloatingActionButton(
      elevation: 2.0,
      tooltip: 'Increment',
      key: Key('_fabmain'),
      onPressed: () {
        tabController.animateTo(0);
      },
      child: Icon(
        Icons.home,
        size: 22.0,
      ),
      backgroundColor: Theme.of(context).accentColor,
    );
  }

  Widget _bottomNavigation(
      BuildContext context, GlobalKey<ScaffoldState> scaffold, double width) {
    double padding = width / 8;
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
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
                    tabController.animateTo(1);
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
                    tabController.animateTo(2);
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
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            HomePage(widget.accounts, widget.services),
            AccountList(widget.accounts,widget.deleteAccount),
            ServiceList(widget.services),
          ],
        ),
        floatingActionButton: _fab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:
            _bottomNavigation(context, _scaffoldKey, _width_50));
  }
}
