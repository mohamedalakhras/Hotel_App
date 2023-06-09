import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotelproject/admin/models/category.dart';
import 'package:hotelproject/models/app_user.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  createNewUser(AppUser appUser) async {
    await firestore.collection('users').doc(appUser.id).set(appUser.toMap());
  }

  Future<AppUser> getUseradatFromFirestore(String id) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firestore.collection('users').doc(id).get();

    Map<String, dynamic>? data = document.data();
    AppUser appUser = AppUser.fromMap(data!);
    return appUser;
  }

  updateUsernfo(AppUser appUser) async {
    await firestore.collection('users').doc(appUser.id).update(appUser.toMap());
  }

  ///// admin functions
  Future<String> createNewCategory(Category category) async {
    DocumentReference<Map<String, dynamic>> document =
        await firestore.collection('categories').add(category.toMap());
    return document.id;
  }

  Future<List<Category>> getallcategery() async {
    QuerySnapshot<Map<String, dynamic>> qurysnapshot =
        await firestore.collection('categories').get();
    List<Category> catogry = qurysnapshot.docs.map((e) {
      Category cat = Category.fromMap(e.data());
      cat.id = e.id;
      return cat;
    }).toList();
    log(catogry.length.toString());
    return catogry;
  }

  // Future<List<Category>> getAllCategories() async {}
  deleteCategory(String id) async {}
  updateCategory(Category newCategory) async {}
}
