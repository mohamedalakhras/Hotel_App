import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hotelproject/app_rout/rout.dart';

import 'package:hotelproject/providers/provider.dart';

import 'package:provider/provider.dart';

class Personal_info extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: ((context, provider, child) {
      return Scaffold(
          body: provider.loggedAppUser == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  key: formKey,
                  child: ListView(children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(30.r, 0.r, 0.r, 0.r),
                      height: 110.r,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 44, 44, 88),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(
                                context,
                              ).pop();
                            },
                            child: ImageIcon(
                              AssetImage('image_file/home/Back.png'),
                              color: Color.fromARGB(255, 245, 245, 245),
                              size: 40.r,
                            ),
                          ),
                          SizedBox(
                            width: 50.r,
                          ),
                          Text(
                            'Personal info',
                            style: TextStyle(
                                color: Color.fromARGB(255, 243, 241, 241),
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.r,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20.r, 0.r, 10.r, 0.r),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                child: provider.loggedAppUser!.imageUrl == null
                                    ? Icon(Icons.camera)
                                    : Image.network(
                                        provider.loggedAppUser!.imageUrl!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              SizedBox(
                                width: 30.r,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 4.r),
                                height: 60,
                                width: 170,
                                child: TextButton(
                                    onPressed: (() {
                                      provider.updateUserImage();
                                    }),
                                    child: Text(
                                      'Change yor photo',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 17.r),
                                    )),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0XFFE7F1FF)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.r,
                          ),
                          CustomTextfield(
                              'FullName:',
                              ((provider.loggedAppUser!.fname!) +
                                  " " +
                                  (provider.loggedAppUser!.lname!)),
                              provider.profileUserNameController),
                          CustomTextfield(
                              'Phone Number:',
                              ((provider.loggedAppUser!.phoneNumber!)),
                              provider.profilePhoneController),
                          CustomTextfield(
                              'Email:',
                              ((provider.loggedAppUser!.email!)),
                              provider.profileEmailController),
                          SizedBox(
                            height: 15.r,
                          ),
                          SizedBox(
                              height: 40,
                              width: 250,
                              child: ElevatedButton(
                                  onPressed: () {
                                    bool isValid =
                                        formKey.currentState!.validate();
                                    if (isValid) {
                                      provider.updateUserInfo();
                                    }

                                    AppRouter.showCustomDiaoug(
                                        'your change information');
                                  },
                                  child: Text(
                                    'save',
                                    style: TextStyle(
                                        fontSize: 20.r,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0XFF3845AB)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ))))),
                        ],
                      ),
                    ),
                  ])));
    }));
  }
}

class CustomTextfield extends StatelessWidget {
  String label;
  String content;
  TextEditingController controller;
  CustomTextfield(this.label, this.content, this.controller);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15.r,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
            },
            decoration: InputDecoration(
                hintText: label,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  String label;
  String content;
  TextEditingController controller;
  ProfileItem(this.label, this.content, this.controller);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
              validator: (String? x) {
                if (x == null || x.isEmpty) {
                  return "this field is required";
                }
              },
              controller: controller,
              style: TextStyle(fontSize: 18)),
        ),
      ]),
    );
  }
}
/*
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotelproject/admin/models/category.dart';
import 'package:hotelproject/helpers/firestore_helper.dart';
import 'package:hotelproject/providers/provider.dart';
import 'package:provider/provider.dart';

////////////////techer/////////////////////
class Personal_info extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
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
      body: Consumer<AuthProvider>(builder: (context, provider, c) {
        return provider.loggedAppUser == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            :
             Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        provider.updateUserImage();
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        color: Colors.grey,
                        child: provider.loggedAppUser!.imageUrl == null
                            ? Icon(Icons.camera)
                            : Image.network(
                                provider.loggedAppUser!.imageUrl!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
ProfileItem(
    'FullName:',
    ((provider.loggedAppUser!.fname!) +
        " " +
        (provider.loggedAppUser!.lname!)),
    provider.profileUserNameController),
ProfileItem(
    'Phone Number:',
    ((provider.loggedAppUser!.phoneNumber!)),
    provider.profilePhoneController),
ProfileItem('Email:', ((provider.loggedAppUser!.email!)),
    provider.profileEmailController),

                    ElevatedButton(
                        onPressed: () {
                          bool isValid = formKey.currentState!.validate();
                          if (isValid) {
                            provider.updateUserInfo();
                          }
                        },
                        child: Text('Update UserInfo')),

                    ElevatedButton(
                        onPressed: () async {
                          Category category =
                              Category(image: "image", name: 'name');
                          String id = await FirestoreHelper.firestoreHelper
                              .createNewCategory(category);
                          log(id);
                        },
                        child: Text('Test Add Category'))
                  ],
                ),
              );
      }),
    );
  }
}

  }
}
*/