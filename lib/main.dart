import 'package:Medkit/res/theme.dart';
import 'package:Medkit/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';

void main() {
 runApp(MaterialApp(
    title: 'Medkit',
    debugShowCheckedModeBanner: false,
    theme: theme,
    home: Welcome(),
  ));
}