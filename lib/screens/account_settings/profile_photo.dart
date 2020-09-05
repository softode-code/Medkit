import 'dart:io';

import 'package:flutter/material.dart';
import 'package:Medkit/shared/widgets/user_display_image.dart';
import 'package:Medkit/models/user_model.dart';
import 'package:Medkit/res/colors.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    Key key,
    @required this.userData, this.onPressed, this.image,
  }) : super(key: key);

  final UserData userData;
  final Function onPressed;
  final File image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Profile Picture',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: subtitleColor
          ),
        ),
        SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserDisplayImage(
              userData: userData,
              size: 100,
              image: image,
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: onPressed,
              child: Text(
                'Pick a photo',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w900
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}