import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final StorageReference _storageReference = FirebaseStorage().ref();
  final String uid;

  StorageService({this.uid});

  Future uploadProfilePhoto(File photo) async{
    StorageTaskSnapshot snapshot = await _storageReference.child('profile photos').child(uid).putFile(photo).onComplete;

    if (snapshot.error == null){
      final String photoUrl = await snapshot.ref.getDownloadURL();
      return photoUrl;
    }
    return null;
  }
}