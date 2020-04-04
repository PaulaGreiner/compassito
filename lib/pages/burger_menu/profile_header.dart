import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  const ProfileHeader(this.name);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 40, top: 40, bottom: 10, right: 17),
          child: ClipOval(
            child: Image.asset(
              'assets/images/perfil.png',
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 28
          ),
        ),
      ],
    );
  }
}
