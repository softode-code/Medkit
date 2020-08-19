import 'package:Medkit/models/user_model.dart';
import 'package:Medkit/res/colors.dart';
import 'package:Medkit/services/database.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:Medkit/shared/widgets/main_header.dart';
import 'package:Medkit/shared/widgets/user_display_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Medications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          UserData userData = snapshot.data;

          return SafeArea(
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: ()=> print('FAB pressed'),
                backgroundColor: primaryColor,
                child: Icon(
                  Icons.add,
                  color: onPrimary,
                ),
              ),
              body: Column(
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
                  MainHeader(title: 'Medications,', subtitle: 'Here are all your medications.',),
                ],
              ),
            ),
          );
        } else {
          return Container(
            height: 0,
            width: 0,
          );
        }
      },
    );
  }
}