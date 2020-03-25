import 'package:flutter/material.dart';
import '../empty_page.dart';
import 'package:compassito/pages/empty_page.dart';

class ProfileMenu extends StatelessWidget {
  final String balance;
  const ProfileMenu(this.balance);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('CP\$ $balance', style: TextStyle(color: Colors.white)),
          Text('Sede Chapecó - SC', style: TextStyle(color: Colors.white)),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Empty()));
              },
              child: Text('Extrato', style: TextStyle(color: Colors.white))),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Empty()));
              },
              child: Text('Resgate', style: TextStyle(color: Colors.white))),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Empty()));
              },
              child:
                  Text('Transferência', style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
