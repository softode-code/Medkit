import 'package:Medkit/res/colors.dart';
import 'package:Medkit/screens/welcome/welcome.dart';
import 'package:Medkit/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          color: primaryColor,
          child: Text(
            'Sign out',
            style: TextStyle(color: onPrimary),
          ),
          onPressed: () {
            _auth.signOut();
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => Welcome()
            ));
          },
        ),
      ),
    );
  }
}