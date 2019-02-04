import 'package:flutter/material.dart';
import '../models/account.dart';
import '../models/service.dart';

class AccountCreatePage extends StatefulWidget {
  final List<Service> services;
  final Function addAccount;

  AccountCreatePage(this.addAccount, this.services);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AccountCreatePage();
  }
}

class _AccountCreatePage extends State<AccountCreatePage> {
  Service _service;
  String _userNameValue;
  String _emailValue;
  String _passwordValue;

  Widget _buildServiceItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _service = widget.services[index];
        });
      },
      child: CircleAvatar(
        radius: 28.0,
        child: Text(
          widget.services[index].name[0].toUpperCase(),
          style: TextStyle(
              fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Color(widget.services[index].color),
      ),
    );
  }

  Widget _buildServiceList() {
    Widget serviceCard = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: _buildServiceItem,
      itemCount: widget.services.length,
    );

    return serviceCard;
  }

  Widget _btnAddService() {
    return Center(
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(21.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/service');
          },
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.blue,
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/lock.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.black,
                          iconSize: 25.0,
                        ),
                        Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(21.0),
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Icon(
                              Icons.star_border,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                child: Text('Selccionar Servicio'),
                padding: EdgeInsets.all(10.0),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 100.0,
                padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                child: widget.services.length == 0
                    ? _btnAddService()
                    : _buildServiceList(),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: TextField(
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                      color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Account Name',
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _userNameValue = value;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: TextField(
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                      color: Colors.black),
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (String value) {
                    setState(() {
                      _emailValue = value;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                      color: Colors.black),
                  decoration: InputDecoration(labelText: 'Password'),
                  onChanged: (String value) {
                    setState(() {
                      _passwordValue = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: RaisedButton(
                  child: Text(
                    'Guardar',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    final Account account = new Account(
                        userName: _userNameValue,
                        email: _emailValue,
                        password: _passwordValue,
                        service: _service);
                    widget.addAccount(account);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
/*Container(
        child: ListView(
          children: <Widget>[
            MaterialButton(
               child: Icon(Icons.arrow_back),
               onPressed: (){
                 Navigator.pop(context);
               },
            ),
            Container(
              child: null,
              height: 100.0,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/lock.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.dstATop),
                ),
              ),
            ),
            Padding(
              child: Text('Selccionar Servicio'),
              padding: EdgeInsets.all(10.0),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 100.0,
              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: widget.services.length == 0
                  ? Center(
                      child: Text('No hay servicios creados',style: TextStyle(color: Colors.black),),
                    )
                  : _buildServiceList(),
            ),
            TextField(
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Account Name',
              ),
              onChanged: (String value) {
                setState(() {
                  _userNameValue = value;
                });
              },
            ),
            TextField(
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  color: Colors.black),
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (String value) {
                setState(() {
                  _emailValue = value;
                });
              },
            ),
            TextField(
              obscureText: true,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  color: Colors.black),
              decoration: InputDecoration(labelText: 'Password'),
              onChanged: (String value) {
                setState(() {
                  _passwordValue = value;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text(
                'SAVE',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                final Account account = new Account(
                    userName: _userNameValue,
                    email: _emailValue,
                    password: _passwordValue);
                widget.addAccount(account);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      )*/
