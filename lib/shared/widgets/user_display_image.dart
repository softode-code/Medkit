import 'package:Medkit/models/user_model.dart';
import 'package:Medkit/res/colors.dart';
import 'package:flutter/material.dart';

class UserDisplayImage extends StatelessWidget {
  const UserDisplayImage({
    Key key, this.userData,
  }) : super(key: key);

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: primaryColor),
            color: primaryLight),
        child: userData.displayImageUrl == null
            ? Icon(
                Icons.person,
                color: primaryColor,
                size: 30,
              )
            : NetworkImage(userData.displayImageUrl, scale: 30));
  }
}