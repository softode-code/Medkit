import 'package:Medkit/res/theme.dart';
import 'package:Medkit/screens/welcome/welcome.dart';
import 'package:Medkit/screens/wrapper.dart';
import 'package:Medkit/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';

void main() {
 runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Medkit',
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: Wrapper(),
  ),
    );
  }
}