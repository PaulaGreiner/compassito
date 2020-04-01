import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './pages/burger_menu/screen.dart';
import './session.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _emailInput = new TextEditingController();
  TextEditingController _passwordInput = new TextEditingController();
  final focus = FocusNode();
  String _hint = 'colaborador@compasso.com.br';
  String _errorEmail = null;
  String _errorPassword = null;
  String _url = 'http://192.168.0.10:8090';
  String _resultado = '';

  _post(String email, String senha) {
    var body = jsonEncode({'login': email, 'senha': senha});
    http.post(_url + "/login", body: body, headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    }).then((response) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      var bodyReturn = json.decode(response.body);

      String token = bodyReturn['token'];
      int id = bodyReturn['idUsuario'];

      Session.token = token;
      Session.id = id;

      if (token != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BurgerMenu(),
          ),
        );
      } else {
        setState(() {
          _errorPassword = 'Login inválido';
        });
      }
    });
  }

  bool _isEmpty(String validationLogin) {
    if (validationLogin.isEmpty) {
      return true;
    }
    return false;
  }

  bool _emailValidation(String validation) {
    if (validation.contains('@') && (validation.contains('.com.br'))) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/logo.png'),
            Padding(
              padding: EdgeInsets.only(right: 60, left: 60, top: 40),
              child: TextField(
                autofocus: true,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: _emailInput,
                onSubmitted: (event) {
                  FocusScope.of(context).requestFocus(focus);
                },
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  hintText: _hint,
                  errorText: _errorEmail,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 60, left: 60, top: 20),
              child: TextField(
                obscureText: true,
                focusNode: focus,
                keyboardType: TextInputType.text,
                autocorrect: false,
                controller: _passwordInput,
                decoration: InputDecoration(
                  errorText: _errorPassword,
                  labelText: 'Senha',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30, left: 30, top: 35),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: () {
                  if (_isEmpty(_emailInput.text)) {
                    setState(() {
                      _errorEmail = 'Campo obrigatório.';
                    });
                  } else if (!_emailValidation(_emailInput.text)) {
                    setState(() {
                      _errorEmail = 'Email inválido.';
                    });
                  } else if (!_emailValidation(_emailInput.text) &&
                      _isEmpty(_emailInput.text) &&
                      _isEmpty(_passwordInput.text)) {
                    setState(() {
                      _errorEmail = null;
                    });
                  } else {
                    setState(() {
                      _errorEmail = null;
                    });
                    _post(_emailInput.text, _passwordInput.text);
                  }
                },
                child: Text('          Entrar          '),
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
