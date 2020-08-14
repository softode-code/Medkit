import 'package:Medkit/models/user_model.dart';
import 'package:Medkit/res/colors.dart';
import 'package:Medkit/screens/home/date_row.dart';
import 'package:Medkit/services/database.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:Medkit/shared/widgets/main_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          return Scaffold(
              body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: defaultPadding, top: defaultPadding),
                      child: getUserDisplayImage(userData),
                    )
                  ],
                ),
                MainHeader(
                  title: 'Hey ' + (userData.name ?? userData.email) + ',',
                  subtitle: 'Here is your plan for today.',
                ),
                SizedBox(height: defaultPadding),
                DateRow()
              ],
            ),
          ));
        }
      },
    );
  }
}

Widget getUserDisplayImage(UserData userData) {
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
