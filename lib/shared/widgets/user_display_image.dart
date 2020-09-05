import 'dart:io';
import 'package:Medkit/models/user_model.dart';
import 'package:Medkit/res/colors.dart';
import 'package:flutter/material.dart';

class UserDisplayImage extends StatelessWidget {
  const UserDisplayImage({
    Key key, this.userData, this.size, this.image,
  }) : super(key: key);

  final UserData userData;
  final double size;
  final File image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: primaryColor),
          color: primaryLight),
      child: image == null ? (userData.displayImageUrl == null
          ? Icon(
              Icons.person,
              color: primaryColor,
              size: 30,
            )
          : CircleAvatar(
              radius: size/2,
              backgroundImage: NetworkImage(userData.displayImageUrl),
              backgroundColor: primaryColor.withOpacity(0.5),
            )
          ):
          CircleAvatar(
            radius: size/2,
            backgroundImage: FileImage(image),
            backgroundColor: primaryColor.withOpacity(0.5),
          )
    );
    }
}

// userData.displayImageUrl == null
//           ? Icon(
//               Icons.person,
//               color: primaryColor,
//               size: 30,
//             )
//           : NetworkImage(userData.displayImageUrl, scale: 30));