import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelproject/providers/provider.dart';
import 'package:hotelproject/screen/Bottombar/home/Room_details/Room_details.dart';
import 'package:hotelproject/screen/Bottombar/home/card_widget.dart';
import 'package:hotelproject/screen/Bottombar/home/carosuel_widget.dart';
import 'package:provider/provider.dart';

class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: ((context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 39, 39, 68),
          elevation: 0,
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 0.r),
            height: 120.r,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 39, 39, 68),
              // color: Color.fromARGB(255, 101, 101, 196),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(50, 50),
                bottomLeft: Radius.elliptical(50, 50),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 3.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Image.asset(
                      //   "image_file/home/Locate.png",
                      //   height: 35,
                      //   fit: BoxFit.cover,
                      //   color: Colors.black,
                      // ),
                      Text(
                        ' HI ${provider.loggedAppUser!.fname!}',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          height: 50,
                          width: 50,
                          child: provider.loggedAppUser!.imageUrl == null
                              ? Icon(Icons.camera)
                              : CircleAvatar(
                                  radius: (50),
                                  backgroundColor: Colors.white,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      provider.loggedAppUser!.imageUrl!,
                                      fit: BoxFit.fill,
                                    ),
                                  ))
                          // Image.network(
                          //     provider.loggedAppUser!.imageUrl!,
                          //     fit: BoxFit.cover,
                          //   ),
                          ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 50,
                      width: 260,
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        decoration: InputDecoration(
                            suffixIcon: Image.asset(
                              "image_file/home/Icon-16x-Search.png",
                            ),
                            hintText: 'Looking for Room',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0))),
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: "labelTxt",
                      // suffixIcon: Image.asset(
                      //   "image_file/home/Icon-16x-Search.png",
                      //     ),
                      //     hintText: "Enter Firstname",
                      //   ),
                      // ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "image_file/home/Icon-24x-Filter.png",
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          carousel_widget(),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 500,
            width: double.infinity,
            child: ListView(
              children: [
                Card_widget('Rectangle 36.png',Room_details()),
                Card_widget('Rectangle -1.png',Room_details()),
                Card_widget('Rectangle -2.png',Room_details()),
                Card_widget('Rectangle 36.png',Room_details()),
                Card_widget('Rectangle -1.png',Room_details()),
                Card_widget('Rectangle -2.png',Room_details()),
                Card_widget('Rectangle 36.png',Room_details()),
                Card_widget('Rectangle -1.png',Room_details()),
              ],
            ),
          ),
        ]),
      );
    }));
  }
}
