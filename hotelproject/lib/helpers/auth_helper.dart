import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotelproject/app_rout/rout.dart';
 

class AuthHelper {
  AuthHelper._osama();
  static AuthHelper authHelper = AuthHelper._osama();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;



  
  Future<String?> login(String email, String password) async {
  
    try {
      UserCredential credential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppRouter.showCustomDiaoug('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        AppRouter.showCustomDiaoug('Wrong password provided for that user.');
      } else {
        AppRouter.showCustomDiaoug(e.toString());
      }

      
    }
  }

  Future<String?> register(String email, String password) async {
    log(email);
    log(password);
    try {
      UserCredential credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      if (e.code == 'weak-password') {
        AppRouter.showCustomDiaoug('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        AppRouter.showCustomDiaoug(
            'The account already exists for that email.');
      } else {
        AppRouter.showCustomDiaoug(e.toString());
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  signout() async {
    await firebaseAuth.signOut();
  }

  User? checkUser() {
    return firebaseAuth.currentUser;
  }
}
