import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BurgerMenu extends StatefulWidget {
  @override
  _BurgerMenuState createState() => _BurgerMenuState();
}

class _BurgerMenuState extends State<BurgerMenu> {
  String _url = 'http://192.168.0.10:8080';
  String accountBalance = 'Carregando...';

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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(45),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/perfil.png',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text('fulano de tal')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
