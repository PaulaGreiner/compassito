import 'dart:convert';

import 'package:flutter/material.dart';
import '../empty_page.dart';
import 'package:compassito/pages/empty_page.dart';

class ProfileMenu extends StatelessWidget {
  final int balance;
  final String office;
  final String uf;
  const ProfileMenu(this.balance, this.office, this.uf);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(color: Colors.white),
          child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 35, right: 10, bottom: 20),
                  child:
                    Text('CP\$ ', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child:
                    Text(balance == null ? "Carregando..." : '$balance',
                      style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
        ),
        Padding(
          padding: EdgeInsets.only (left: 36, top: 4),
          child:
            Text('Sede ' + office + ' - ' + uf, style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
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
                    padding: EdgeInsets.only(left: 25, bottom: 10, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Image.asset('assets/images/extrato.png'),
                        ),
                        Text('Extrato', style: TextStyle(color: Colors.white, fontSize: 31)),
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
                        Text('Resgate', style: TextStyle(color: Colors.white, fontSize: 31)),
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
                        Text('Transferência', style: TextStyle(color: Colors.white, fontSize: 31)),
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
                  TextStyle(color: Colors.white, fontSize: 25)),
            ],
          ),
        ),
    Padding(
      padding: EdgeInsets.only(top: 20, left: 13, bottom: 20),
      child: Text('CP\$ Compassito',
        style: TextStyle(color: Colors.white, fontSize: 22))),
      ],
    );
  }
}
