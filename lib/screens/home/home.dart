import 'package:Medkit/models/medication_model.dart';
import 'package:Medkit/models/user_model.dart';
import 'package:Medkit/res/colors.dart';
import 'package:Medkit/screens/home/dashboard/dashboard.dart';
import 'package:Medkit/screens/home/medications/medication_tile.dart';
import 'package:Medkit/screens/home/medications/medications.dart';
import 'package:Medkit/screens/take_medication/take_medication_dialog.dart';
import 'package:Medkit/services/database.dart';
import 'package:Medkit/services/notification.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:Medkit/shared/widgets/two_buttons.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();

NotificationAppLaunchDetails notificationAppLaunchDetails;

class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static List<Widget> _widgetOptions =[
    Dashboard(),
    Medications()
  ];

  List<BottomNavigationBarItem> _navBarItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/dashboard.svg'),
      activeIcon: SvgPicture.asset('assets/icons/dashboard_active.svg', width: 30, height: 30,),
      title: Text('Dashboard'),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/carbon_pills.svg'),
      activeIcon: SvgPicture.asset('assets/icons/carbon_pills_active.svg', width: 30, height: 30,),
      title: Text('Medications')
    )
  ];

  int _selectedIndex =0;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  UserModel user;

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
      },
    );
    _initializeFlutterNotificationPlugin(context);
  }

  @override
  Widget build(BuildContext context) {  

    user = Provider.of<UserModel>(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: _navBarItems,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  Future _initializeFlutterNotificationPlugin(BuildContext context) async {
    notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  var initializationSettingsAndroid = AndroidInitializationSettings('favicon');
  // Note: permissions aren't requested here just to demonstrate that can be done later using the `requestPermissions()` method
  // of the `IOSFlutterLocalNotificationsPlugin` class
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {
        didReceiveLocalNotificationSubject.add(ReceivedNotification(
            id: id, title: title, body: body, payload: payload));
      });
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    selectNotificationSubject.add(payload);
  });
    _requestIOSPermissions();
    _configureDidReceiveLocalNotificationSubject(context);
    _configureSelectNotificationSubject(context);
  }
  void _requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void _configureDidReceiveLocalNotificationSubject(BuildContext context) {
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body)
              : null,
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Ok'),
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                await notificationRecieved(receivedNotification.payload);
              },
            )
          ],
        ),
      );
    });
  }

  void _configureSelectNotificationSubject(BuildContext context) {
    selectNotificationSubject.stream.listen((String payload) async {
      await notificationRecieved(payload);
    });
  }

  Future notificationRecieved(String payload) async {
    Medication medication = await DatabaseService(uid: user.uid).getMedication(payload);
    await showDialog(
      context: context,
      builder: (context) {
        return TakeMedicationDialog(
          medication: medication,
          onTakePressed: () async{
            await DatabaseService(uid: user.uid).updateInventory(medication);
            Navigator.pop(context);
          },
          onCancelPressed: () {
            Navigator.pop(context);
          },
        );
      }
    );
  }

}