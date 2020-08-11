import 'package:Medkit/res/colors.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:Medkit/shared/widgets/welcome_header.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String _email = '';
  String _password = '';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: WelcomeHeader(size: size, title: 'Create\nAccount', illustration: 'assets/illustrations/welcome_illustration.svg',),
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
                          validator: (val) => val.length < 6 ? 'Password must be at least 6 characters long.' : null,
                          decoration: InputDecoration(hintText: 'Password'),
                          onChanged: (val) {
                            setState(() {
                              _password = val;
                            });
                          },
                        ),
                        SizedBox(height: defaultPadding*2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 28,
                                color: onWhiteBackground,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            FlatButton(
                              color: Colors.transparent,
                              onPressed: () {print('Sign up pressed');},
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [primaryColor, primaryLight],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    stops: [0.5 ,1.0]
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.navigate_next, color: onPrimary,),
                                ),
                              ),
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
                      
                    },
                    child: Text(
                      'Login',
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