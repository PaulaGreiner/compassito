import 'package:compassito/pages/burger_menu/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './profile_header.dart';

class BurgerMenu extends StatefulWidget {
  @override
  _BurgerMenuState createState() => _BurgerMenuState();
}

class _BurgerMenuState extends State<BurgerMenu> {
  String _url = 'http://192.168.0.10:8080';
  String accountBalance = 'Carregando...';
  String name = 'Cleiton';

  _requestFromApi() {
    http.get(_url + "/saldo/3", headers: {"Accept": "application/json"}).then(
        (response) {
      var body = jsonDecode(response.body);
      setState(() {
        accountBalance = body['saldo'].toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _requestFromApi();
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
            ProfileMenu(accountBalance),
          ],
        ),
      ),
    );
  }
}
