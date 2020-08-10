import 'package:Medkit/res/colors.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:Medkit/shared/widgets/welcome_header.dart';
import 'package:Medkit/shared/widgets/wide_outline_button.dart';
import 'package:Medkit/shared/widgets/wide_primary_button.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          WelcomeHeader(size: size, title: 'Welcome to\nMedkit', illustration: 'assets/illustrations/welcome_illustration.svg',),
          SizedBox(height: defaultPadding/2,),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              'Track your medicines on daily basis.',
              style: TextStyle(
                fontSize: 18,
                color: onWhiteBackgroundLight
              ),
            ),
          ),
          SizedBox(height: defaultPadding,),
          Column(
            children: [
              WidePrimaryButton(size: size, onPressed: (){}, text: 'Login'),
              WideOutlineButton(size: size, onPressed: (){}, text: 'Sign Up',)
            ],
          )
        ],
      ),
    );
  }
}