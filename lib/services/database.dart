import 'package:Medkit/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUserData(User user) async {
    return await userCollection.document(uid).setData(user.toMap());
  }

}