import 'package:Medkit/models/medication_model.dart';
import 'package:Medkit/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

}