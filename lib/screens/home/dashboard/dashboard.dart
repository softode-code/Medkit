import 'package:Medkit/models/user_model.dart';
import 'package:Medkit/res/colors.dart';
import 'package:Medkit/services/database.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:Medkit/shared/widgets/main_header.dart';
import 'package:Medkit/shared/widgets/user_display_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'date_row.dart';


class Dashboard extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: defaultPadding, top: defaultPadding),
                      child: UserDisplayImage(userData: userData,),
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
          );
        } else {
          return Container(
            width: 0,
            height: 0,
          );
        }
      },
    );
  }
}