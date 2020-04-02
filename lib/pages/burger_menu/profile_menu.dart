import 'dart:convert';

import 'package:flutter/material.dart';
import '../empty_page.dart';
import 'package:compassito/pages/empty_page.dart';

class ProfileMenu extends StatelessWidget {
  final String balance;
  final String office;
  final String uf;
  const ProfileMenu(this.balance, this.office, this.uf);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 260, bottom: 10),
          child: Text('CP\$ $balance',
            style: TextStyle(color: Colors.white, fontSize: 15)),
        ),
        Text(office, style: TextStyle(color: Colors.white)),
        Text(uf, style: TextStyle(color: Colors.white)),
        Menu(),
        Expanded(child: BottomMenu())
      ],
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Empty()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 25, bottom: 10, top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Image.asset('assets/images/extrato.png'),
                        ),
                        Text('Extrato', style: TextStyle(color: Colors.white, fontSize: 38)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Empty()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 25, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Image.asset('assets/images/resgate.png'),
                        ),
                        Text('Resgate', style: TextStyle(color: Colors.white, fontSize: 39)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Empty()));
                  },
                  child: Padding(
                    padding:EdgeInsets.only(left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Image.asset('assets/images/transferencia.png'),
                        ),
                        Text('Transferência', style: TextStyle(color: Colors.white, fontSize: 39)),
                      ],
                    ),
                  ),
                ),
              ],
            );
  }
}

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
            context, MaterialPageRoute(builder: (context) => Empty()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(
                  Icons.settings,
                    color: Colors.white,
                    size: 40,
                  ),
              ),
              Text('Meu perfil',
                style:
                  TextStyle(color: Colors.white, fontSize: 30)),
            ],
          ),
        ),
    Padding(
      padding: EdgeInsets.only(top: 20, left: 13, bottom: 20),
      child: Text('CP\$ Compassito',
        style: TextStyle(color: Colors.white, fontSize: 26))),
      ],
    );
  }
}
