
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task_imagelist/view/welcome_page.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
  Future<void> signOut() async {
    try {
      Get.offAll(WelcomPage());
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
