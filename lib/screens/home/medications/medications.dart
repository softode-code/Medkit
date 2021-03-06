import 'package:Medkit/models/user_model.dart';
import 'package:Medkit/res/colors.dart';
import 'package:Medkit/screens/account_settings/account_settings.dart';
import 'package:Medkit/screens/new_medication/new_medication.dart';
import 'package:Medkit/services/database.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:Medkit/shared/widgets/main_header.dart';
import 'package:Medkit/shared/widgets/user_display_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Medkit/screens/home/medications/medication_list.dart';
import 'package:Medkit/models/medication_model.dart';

class Medications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          UserData userData = snapshot.data;

          return StreamProvider<List<Medication>>.value(
            value: DatabaseService(uid: user.uid).medications,
            child: SafeArea(
              child: Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: ()=> openNewMedication(context),
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.add,
                    color: onPrimary,
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.only(left: defaultPadding, right: defaultPadding, top: defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: defaultPadding),
                            child: GestureDetector(
                              child: UserDisplayImage(userData: userData, size: 50,),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AccountSettings())
                              ),
                            ),
                          )
                        ],
                      ),
                      MainHeader(title: 'Medications,', subtitle: 'Here are all your medications.',),
                      SizedBox(height: defaultPadding*1.5,),
                      MedicationList()
                    ],
                  ),
                ),
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

openNewMedication(context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => NewMedication()
  ));
}