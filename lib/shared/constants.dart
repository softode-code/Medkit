import 'package:Medkit/res/colors.dart';
import 'package:flutter/material.dart';

const double defaultPadding = 20.0;

InputDecoration inputDecoration =  InputDecoration(
  border: InputBorder.none,
  contentPadding: EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding),
  focusColor: primaryColor,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: primaryColor,
      width: 1
    )
  )
);

TextStyle inputLabelStyle = TextStyle(
  color: subtitleColor,
  fontSize: 16,
  fontWeight: FontWeight.w500
);