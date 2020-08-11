import 'package:Medkit/res/colors.dart';
import 'package:flutter/material.dart';

class RoundGradientButton extends StatelessWidget {
  const RoundGradientButton({
    Key key, 
    @required this.onPressed,
  }) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
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
    );
  }
}