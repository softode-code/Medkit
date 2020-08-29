import 'package:Medkit/res/theme.dart';
import 'package:Medkit/screens/welcome/welcome.dart';
import 'package:Medkit/screens/wrapper.dart';
import 'package:Medkit/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/user_model.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
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