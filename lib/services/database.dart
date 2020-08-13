import 'package:Medkit/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUserData(UserData user) async {
    return await userCollection.document(uid).setData(user.toMap());
  }

  UserData _userFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      name: snapshot.data['name'],
      email: snapshot.data['email'],
      displayImageUrl: snapshot.data['displayImageUrl'],
      gender: snapshot.data['gender']
    );
  }

  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userFromSnapshot);
  }

}