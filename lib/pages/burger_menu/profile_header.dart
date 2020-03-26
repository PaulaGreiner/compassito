import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  const ProfileHeader(this.name);

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Text(name, style: TextStyle(color: Colors.white))
      ],
    );
  }
}
