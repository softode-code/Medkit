import 'package:Medkit/models/medication_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{

  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'Medication Reminder', 'Medication Reminder', 'Sends daily reminder for medications'
    );
    var iosPlatformChannelSpecifics = IOSNotificationDetails();


  Future addDailyNotification(Medication medication) async {

    var time = Time(medication.hour, medication.minute,0);
    NotificationDetails notificationDetails = NotificationDetails(
      androidPlatformChannelSpecifics, iosPlatformChannelSpecifics
    );

    await FlutterLocalNotificationsPlugin().showDailyAtTime(
      0,
      medication.name,
      'It\'s time to take your medication.',
      time,
      notificationDetails,
      payload: medication.name
    );
    print('Medication Notification added: ');
    print(medication.toMap());
    return medication;
  }

  Future cancelAll() async {
    await FlutterLocalNotificationsPlugin().cancelAll();
  }

}