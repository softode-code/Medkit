import 'package:Medkit/screens/authenticate/login.dart';
import 'package:Medkit/screens/authenticate/signup.dart';
import 'package:flutter/material.dart';


class Authenticate extends StatefulWidget {
  bool showSignUp = false;

  Authenticate({this.showSignUp});

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {



  void toggleSignin(){
    setState(() {
      widget.showSignUp = !widget.showSignUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(widget.showSignUp){
      return SignUp(toggleView: toggleSignin,);
    } else {
      return Login(toggleView: toggleSignin,);
    }
  }
}