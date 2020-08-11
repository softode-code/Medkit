import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerUser(String email, String password) async {
    try{
      AuthResult result =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e){
      print(e.toString());
      return null;
    }
  }

  Future login(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
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