import 'package:compassito/pages/burger_menu/profile_menu.dart';
import 'package:compassito/session.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './profile_header.dart';
import './profile_menu.dart';

class BurgerMenu extends StatefulWidget {
  @override
  _BurgerMenuState createState() => _BurgerMenuState();
}

class _BurgerMenuState extends State<BurgerMenu> {
  String _url = 'http://192.168.0.10:8090';
  String accountBalance = 'Carregando...';
  String name = 'Carregando...';
  String office = 'Carregando...';
  String uf = 'Carregando...';

  _BurgerMenuState() {
    this._balanceRequest();
    this._nameRequest();
  }

  _balanceRequest() {
    http.get(_url + "/saldo/${Session.id}", headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Session.token}'
    }).then((response) {
      var body = jsonDecode(response.body);
      setState(() {
        accountBalance = body['saldo'].toString();
      });
    });
  }

  _nameRequest() {
    http.get(_url + '/usuarios/${Session.id}', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Session.token}'
    }).then((response) {
      var body = jsonDecode(response.body);
      setState(() {
        name = body['nome'];
        office = body['idUnidade']['cidade'];
        uf = body['idUnidade']['uf'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg-menu-mobile.png'),
                fit: BoxFit.cover)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ProfileHeader(name),
            Expanded(
              child: ProfileMenu(accountBalance, office, uf)
            ),
          ],
        ),
      ),
    );
  }
}
