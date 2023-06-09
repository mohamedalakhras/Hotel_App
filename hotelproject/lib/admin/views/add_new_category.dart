import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotelproject/admin/providers/admin_provider.dart';
import 'package:hotelproject/helpers/firestore_helper.dart';
import 'package:hotelproject/providers/provider.dart';

import 'package:provider/provider.dart';

class AddNewCategory extends StatelessWidget {
  GlobalKey<FormState> catKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, c) {
        return Form(
          key: catKey,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  provider.pickCategoryImage();
                },
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey,
                  child: provider.pickedImage == null
                      ? Icon(Icons.camera)
                      : Image.file(
                          provider.pickedImage!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
               
                validator: (x) {
                  if (x == null || x.isEmpty) {
                    return "required field";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    bool isValid = catKey.currentState!.validate();
                    if (isValid) {
                      provider.createNewCategory();
                    }
                  },
                  child: Text('Create New Category')),
              ElevatedButton(
                  onPressed: () {
                    FirestoreHelper.firestoreHelper.getallcategery();
                    log('message');
                  },
                  child: Text('show all catogry'))
            ],
          ),
        );
      }),
    );
  }
}
