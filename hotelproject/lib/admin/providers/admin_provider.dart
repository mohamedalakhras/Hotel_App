import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hotelproject/admin/models/category.dart';
import 'package:hotelproject/app_rout/rout.dart';
import 'package:hotelproject/helpers/firestore_helper.dart';
import 'package:hotelproject/helpers/storage_helper.dart';

import 'package:image_picker/image_picker.dart';


class AdminProvider extends ChangeNotifier {
  /// admin process
  TextEditingController catNameController = TextEditingController();
  File? pickedImage;
  List<Category>? categories;
  pickCategoryImage() async {
    //1 - pick image from gallery
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      pickedImage = File(xfile.path);
      notifyListeners();
    }
  }

  createNewCategory() async {
    if (pickedImage != null) {
      AppRouter.showLoaderDialog();
      // 2- upload image to firebase storage and get its url
      String imageUrl = await StorageHelper.storageHelper
          .uploadImage("categories_images", pickedImage!);

      // 3- create category object from image url and textfield
      Category category =
          Category(image: imageUrl, name: catNameController.text);
      // 4- create new category document using category object
      FirestoreHelper.firestoreHelper.createNewCategory(category);
      AppRouter.hideLoadingDialoug();
      AppRouter.showCustomDiaoug('The category has been successfully added');
    } 
  }
}
