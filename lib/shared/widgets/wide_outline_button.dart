import 'package:Medkit/res/colors.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:flutter/material.dart';

class WideOutlineButton extends StatelessWidget {
  const WideOutlineButton({
    Key key,
    @required this.size, @required this.onPressed, @required this.text,
  }) : super(key: key);

  final Size size;
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(defaultPadding, defaultPadding/2, defaultPadding, defaultPadding/2),
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.transparent,
        border: Border.all(
          color: primaryColor,
          width: 1
        )
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding/1.5),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 24,
                color: primaryColor
              ),
            ),
          ),
        ),
      ),
    );
  }
}