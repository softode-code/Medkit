import 'package:Medkit/models/medication_model.dart';
import 'package:Medkit/models/user_model.dart';
import 'package:Medkit/services/database.dart';
import 'package:Medkit/services/notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthService {

  FirebaseAuth _auth;
  
  AuthService() {
    _auth = FirebaseAuth.instance;
  }

  UserModel _userFromFirebaseUser(User user) {
    return user != null? UserModel(uid: user.uid) : null;
  }

  Stream<UserModel> get user {
    return _auth.authStateChanges()
    .map(_userFromFirebaseUser);
  }

  Future registerUser(String email, String password) async {
    try{
      UserCredential result =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      DatabaseService databaseService = DatabaseService(uid: user.uid);
      await databaseService.updateUserData(UserData(name: null, email: user.email, gender: null, displayImageUrl: null));
      await databaseService.addToken();
      return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }

  Future login(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      DatabaseService databaseService = DatabaseService(uid: user.uid);
      await databaseService.addToken();
      await databaseService.setAllReminders();
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      NotificationService().cancelAll();
      return _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
    
  }

}