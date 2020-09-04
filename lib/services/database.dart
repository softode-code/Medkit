import 'package:Medkit/models/medication_model.dart';
import 'package:Medkit/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(UserData user) async {
    return await userCollection.doc(uid).set(user.toMap());
  }

  UserData _userFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      name: snapshot.data()['name'],
      email: snapshot.data()['email'],
      displayImageUrl: snapshot.data()['displayImageUrl'],
      gender: snapshot.data()['gender']
    );
  }

  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }

  Future addMedication(Medication medication) async {
    CollectionReference medicationCollection = userCollection.doc(uid).collection('medication');
    return await medicationCollection.doc(medication.name).set(medication.toMap());
  }

  Future addToken() async {
    FirebaseMessaging messaging = FirebaseMessaging();
    await messaging.getToken().then((value) {
      userCollection.doc(uid).collection('tokens').doc(value).set(
        {
          'token': value
        }
      );
      return value;
    });
    return null;
  }

  List<Medication> _medicationListfromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Medication.mapConstructor(doc.data());
    }).toList();
  }

  Stream<List<Medication>> get medications {
    return userCollection.doc(uid).collection('medication').snapshots().map(_medicationListfromSnapshot);
  }

}