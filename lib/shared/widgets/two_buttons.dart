import 'package:Medkit/res/colors.dart';
import 'package:flutter/material.dart';

class TwoButtons extends StatelessWidget {
  const TwoButtons({
    Key key,
    @required Color saveBtnColor,
    this.onPrimaryPressed, 
    this.onSecondaryPressed, this.primaryText,
  }) : _saveBtnColor = saveBtnColor, super(key: key);

  final Color _saveBtnColor;
  final Function onPrimaryPressed;
  final Function onSecondaryPressed;
  final String primaryText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlineButton(
          onPressed: onSecondaryPressed, 
          child: Text(
            'Cancel',
            style: TextStyle(
              fontSize: 16
            ),
          ),
          textColor: primaryColor,
          color: primaryColor,
          borderSide: BorderSide.none
        ),
        Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(8),
           color: _saveBtnColor
         ),
         child: FlatButton(
           onPressed: onPrimaryPressed,
           child: Align(
             alignment: Alignment.center,
             child: Text(
               primaryText,
               style: TextStyle(
                 fontSize: 16,
                 fontWeight: FontWeight.w500,
                 color: onPrimary
               ),
             ),
           ),
         ),
        )
      ],
    );
  }
}