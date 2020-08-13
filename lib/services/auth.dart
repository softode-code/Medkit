import 'package:Medkit/models/user_model.dart';
import 'package:Medkit/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
    .map(_userFromFirebaseUser);
  }

  Future registerUser(String email, String password) async {
    try{
      AuthResult result =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      DatabaseService databaseService = DatabaseService(uid: user.uid);
      await databaseService.updateUserData(UserData(name: null, email: user.email, gender: null, displayImageUrl: null));
      return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }

  Future login(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      return _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
    
  }

}