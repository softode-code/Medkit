import 'package:Medkit/res/colors.dart';
import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  primaryColorLight: primaryColor,
  fontFamily: 'Mulish',
  scaffoldBackgroundColor: scaffoldBackground,
  textTheme: TextTheme(
    headline4: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 36
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 28
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.normal,
      color: subtitleColor
    ),
    caption: TextStyle(
       fontSize: 13,
      fontWeight: FontWeight.w500
    )
  )
);