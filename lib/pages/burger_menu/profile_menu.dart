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
        Text('CP\$ $balance',
            style: TextStyle(color: Colors.white, fontSize: 15)),
        Text(office, style: TextStyle(color: Colors.white)),
        Text(uf, style: TextStyle(color: Colors.white)),
        Menu()
      ],
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Empty()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Image.asset('assets/images/extrato.png'),
              ),
              Text('Extrato', style: TextStyle(color: Colors.white)),
            ],
          )),
      GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Empty()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Image.asset('assets/images/resgate.png'),
              ),
              Text('Resgate', style: TextStyle(color: Colors.white)),
            ],
          )),
      GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Empty()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Image.asset('assets/images/transferencia.png'),
              ),
              Text('Transferência', style: TextStyle(color: Colors.white)),
            ],
          )),
      GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Empty()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
              Text('Meu perfil', style: TextStyle(color: Colors.white)),
            ],
          )),
      Text('CP\$ Compassito', style: TextStyle(color: Colors.white))
    ]);
  }
}
