import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _emailInput = new TextEditingController();
  TextEditingController _passwordInput = new TextEditingController();
  final focus = FocusNode();
  String _hint = 'colaborador@compasso.com.br';
  String _error = null;

  bool _isEmpty(String validationLogin) {
    if(validationLogin.isEmpty) {
      return true;
    }
    return false;
  }

  bool _emailValidation(String validation) {
    if(validation.contains('@') && (validation.contains('.com.br'))) {
      
      return true;
    } 
    return false;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold( //Container pega a página inteira, Scaffold permite a separação da página em até três partes
      body: Container(
        width: MediaQuery.of(context).size.width, //define a largura da tela. MediaQuery pega o tamanho da tela. Context faz referência a ela. 
        height: MediaQuery.of(context).size.height,
        child: Column
          (children:
           <Widget>[
            Image.asset('assets/images/logo.png'),
            Padding(
              padding: EdgeInsets.only(right: 60, left: 60, top: 40),
                child: TextField(
                  autofocus: true, //foca no primeiro input ao abrir o app
                  textInputAction: TextInputAction.next, //insere a seta de próximo no teclado
                  keyboardType: TextInputType.emailAddress, //define o teclado de email, que possui @
                  autocorrect: false, //desativa o corretor que, por padrão, é true
                  controller: _emailInput, //guarda os valores que estão no input
                  onSubmitted: (event){
                    FocusScope.of(context).requestFocus(focus); //troca o foco conforme os inputs forem preenchidos
                  },
                  decoration: InputDecoration( //define a estilização do input
                    labelText: 'E-mail', 
                    hintText: _hint,
                    errorText: _error,
              ),
             ),
             ),
             Padding(
              padding: EdgeInsets.only(right: 60, left: 60, top: 20),
                child: TextField(
                  obscureText: true, //esconde a senha no visor
                  focusNode: focus, //recebe o foco do input anterior
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  controller: _passwordInput,
                  decoration: InputDecoration(
                    labelText: 'Senha', 
              ),
             ),
             ),
              Padding(
                padding: EdgeInsets.only(right: 30, left: 30, top: 35),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.orange,
                    textColor: Colors.white,
                    onPressed: (){
                      if(_isEmpty(_emailInput.text)) {
                        setState(() {  
                          _error = 'Campo obrigatório.';
                        });
                      } else if (!_emailValidation(_emailInput.text)){
                        setState(() {
                          _error = 'Email inválido.';
                        });
                      }
                      else{
                        setState(() {
                          _error = null;
                        });
                      }
                      
                      print(_passwordInput.text);
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