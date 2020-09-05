import 'package:flutter/material.dart';
import 'package:Medkit/shared/widgets/user_display_image.dart';
import 'package:Medkit/models/user_model.dart';
import 'package:Medkit/res/colors.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    Key key,
    @required this.userData,
  }) : super(key: key);

  final UserData userData;

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
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => print('pick a photo'),
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