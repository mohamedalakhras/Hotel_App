import 'package:flutter/material.dart';
import 'package:hotelproject/admin/views/add_new_category.dart';
import 'package:hotelproject/app_rout/rout.dart';

import 'package:hotelproject/helpers/auth_helper.dart';
import 'package:hotelproject/helpers/firestore_helper.dart';
import 'package:hotelproject/helpers/storage_helper.dart';
import 'package:hotelproject/models/app_user.dart';
import 'package:hotelproject/screen/drower/profile/profile_info.dart';
import 'package:hotelproject/screen/main_screen/main_screen.dart';
import 'package:hotelproject/screen/log_in/login_screen.dart';
import 'package:hotelproject/screen/register/register.dart';
import 'package:hotelproject/screen/spalsh_screen/ferst_screen.dart';
import 'package:hotelproject/screen/spalsh_screen/spalch_screen.dart';

import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    log('provider constructor');
    checkUser();
  }
  TextEditingController loginEmailCOntroller = TextEditingController();
  TextEditingController loginPasswordCOntroller = TextEditingController();
  TextEditingController registerEmailCOntroller = TextEditingController();
  TextEditingController registerPasswordCOntroller = TextEditingController();
  TextEditingController registerfnameCOntroller = TextEditingController();

  TextEditingController registerlnameCOntroller = TextEditingController();

  TextEditingController registerPhoneCOntroller = TextEditingController();
  TextEditingController profileUserNameController = TextEditingController();
  TextEditingController profilePhoneController = TextEditingController();
  TextEditingController profileEmailController = TextEditingController();

  AppUser? loggedAppUser;
  late User loggedUSer;

  login() async {
    String? userId = await AuthHelper.authHelper
        .login(loginEmailCOntroller.text.trim(), loginPasswordCOntroller.text);
    if (userId != null) {
      log(userId);
      getUserFromFirestore(userId);
      AppRouter.navigateAndReplaceScreen(Home_screen());
    }
  }

  getUserFromFirestore(String id) async {
    loggedAppUser =
        await FirestoreHelper.firestoreHelper.getUseradatFromFirestore(id);
    loggedAppUser!.id = id;
    profileUserNameController.text = loggedAppUser!.fname ?? '';
    profilePhoneController.text = loggedAppUser!.phoneNumber ?? '';
    profileEmailController.text = loggedAppUser!.email ?? '';
    notifyListeners();
  }

  register() async {
    String? userId = await AuthHelper.authHelper.register(
        registerEmailCOntroller.text.trim(), registerPasswordCOntroller.text);
    if (userId != null) {
      getUserFromAuth();
      AppUser appUser = AppUser(
          loggedUSer.uid,
          registerfnameCOntroller.text,
          registerlnameCOntroller.text,
          registerPhoneCOntroller.text,
          loggedUSer.email);
      FirestoreHelper.firestoreHelper.createNewUser(appUser);
      getUserFromFirestore(userId);
      AppRouter.navigateAndReplaceScreen(Home_screen());
    }
  }

  getUserFromAuth() {
    loggedUSer = AuthHelper.authHelper.checkUser()!;
  }

  checkUser() async {
    await Future.delayed(const Duration(seconds: 5));
    User? user = AuthHelper.authHelper.checkUser();

    if (user == null) {
      //navigation to auth screen
      AppRouter.navigateToScreen(
        spalsh_screen(),
      );
    } else {
      getUserFromFirestore(user.uid);
      AppRouter.navigateAndReplaceScreen(Home_screen());
    }
  }

  signOut() async {
    AuthHelper.authHelper.signout();
    AppRouter.navigateAndReplaceScreen(LoginScreen());
  }

  updateUserInfo() async {
    loggedAppUser!.fname = profileUserNameController.text;
    loggedAppUser!.phoneNumber = profilePhoneController.text;
    FirestoreHelper.firestoreHelper.updateUsernfo(loggedAppUser!);
    getUserFromFirestore(loggedAppUser!.id!);
  }

  updateUserImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      String imageUrl =
          await StorageHelper.storageHelper.uploadImage("profile_images", file);
      log(imageUrl);
      loggedAppUser!.imageUrl = imageUrl;
      await FirestoreHelper.firestoreHelper.updateUsernfo(loggedAppUser!);
      loggedAppUser!.imageUrl = imageUrl;
      notifyListeners();
    }
  }
}


// class Provider1 extends ChangeNotifier {
//    TextEditingController con_sign_nam = TextEditingController();
//   TextEditingController con_sign_phon = TextEditingController();
//   TextEditingController con_sign_pass = TextEditingController();
//   TextEditingController con_sign_retyp = TextEditingController();
  
//   Provider1() {
//     chechuser();
//   }

//   chechuser() async {
//     await Future.delayed(Duration(seconds: 5));
//     Approut.puchfun(Main_screen());
//   }




// }
