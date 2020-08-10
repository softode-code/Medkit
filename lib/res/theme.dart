import 'package:Medkit/res/colors.dart';
import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  fontFamily: 'Mulish',
  scaffoldBackgroundColor: scaffoldBackground,
  textTheme: TextTheme(
    headline4: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 36
    )
  )
);