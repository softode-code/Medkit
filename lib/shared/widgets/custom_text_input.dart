import 'package:Medkit/res/colors.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    Key key,
    @required this.label,
    this.hint,
    @required this.onChanged,
    this.validator, this.type, this.width, this.value,
    
  }) : super(key: key);

  final String label;
  final String hint;
  final Function onChanged;
  final Function validator;
  final TextInputType type;
  final double width;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: inputLabelStyle
        ),
        SizedBox(height: 10,),
        CustomTextFormField(width: width, type: type, hint: hint, validator: validator, onChanged: onChanged, value: value,)
      ]
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key key,
    @required this.width,
    @required this.type,
    @required this.hint,
    @required this.validator,
    @required this.onChanged, this.value,
  }) : super(key: key);

  final double width;
  final TextInputType type;
  final String hint;
  final Function validator;
  final Function onChanged;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: width ?? double.maxFinite,
      decoration: BoxDecoration(
        color: inputFieldColor,
        borderRadius: BorderRadius.circular(8)
      ),
      child: TextFormField(
        initialValue: value,
        keyboardType: type ?? TextInputType.text,
        style: TextStyle(
          color: onWhiteBackground,
          fontSize: 18,
        ),
        decoration: inputDecoration.copyWith(hintText: hint),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}