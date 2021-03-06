import 'package:Medkit/res/colors.dart';
import 'package:Medkit/screens/authenticate/round_gradient_button.dart';
import 'package:Medkit/screens/home/home.dart';
import 'package:Medkit/services/auth.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:Medkit/shared/widgets/welcome_header.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {

  final Function toggleView;

  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String _email = '';
  String _password = '';
  final _formkey = GlobalKey<FormState>();
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: WelcomeHeader(size: size, title: 'Welcome\nBack', illustration: 'assets/illustrations/welcome_illustration.svg',),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) => val.isEmpty ? 'Enter an email' : null,
                          decoration: InputDecoration(hintText: 'Email'),
                          onChanged: (val) {
                            setState(() {
                              _email = val;
                            });
                          },
                        ),
                        SizedBox(height: 5,),
                        TextFormField(
                          validator: (val) => val.isEmpty ? 'Enter a password.' : null,
                          decoration: InputDecoration(hintText: 'Password'),
                          onChanged: (val) {
                            setState(() {
                              _password = val;
                            });
                          },
                          obscureText: true,
                        ),
                        SizedBox(height: defaultPadding*2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 28,
                                color: onWhiteBackground,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            RoundGradientButton(
                              onPressed: () async {
                                if(_formkey.currentState.validate()) {
                                   await _auth.login(_email, _password);
                                }
                              }
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: defaultPadding),
                  child: GestureDetector(
                    onTap: (){
                      widget.toggleView();
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}