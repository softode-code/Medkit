import 'package:Medkit/res/colors.dart';
import 'package:Medkit/services/auth.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:flutter/material.dart';

class LogoutBtn extends StatelessWidget {
  LogoutBtn({
    Key key,
  }) :super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        _auth.signOut();
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.all(defaultPadding/2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: primaryColor.withOpacity(0.13),
        ),
        child: Row(
          children: [
            Icon(Icons.logout, color: primaryColor,),
            SizedBox(width: 8),
            Text(
              'Logout',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 18
              ),
            )
          ],
        ),
      ),
      
    );
  }
}