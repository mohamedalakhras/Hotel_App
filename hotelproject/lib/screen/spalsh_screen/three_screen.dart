import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelproject/app_rout/rout.dart';
import 'package:hotelproject/screen/log_in/login_screen.dart';
import 'package:hotelproject/screen/register/register.dart';

class Three_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.white),
      body: Column(
        children: [
          Container(
            child: Image.asset(
              "image_file/any_screen/3screen.png",
              fit: BoxFit.fill,
            ),
            width: double.infinity,
            height: 400.r,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(48.r, 29.r, 48.r, 35.r),
            child: Column(
              children: [
                Text(
                  "Cool and  secure        service",
                  style: TextStyle(fontSize: 25.r, color: Color(0xff3845AB)),
                ),
                SizedBox(
                  height: 10.r,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 4.r,
                      width: 82.r,
                      color: Color(0xffEEA86C),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.r,
                ),
                Text(
                  "We provide you with a variant of    accomodaion for a better choice",
                  style: TextStyle(fontSize: 16.r),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 40.r,
                ),
                Row(
                  children: [
                    SizedBox(
                        height: 50.r,
                        width: 110.r,
                        child: ElevatedButton(
                          onPressed: () {
                            AppRouter.navigateToScreen(RegisterScreen());
                          },
                          child: Text(
                            'sign up',
                            style:
                                TextStyle(fontSize: 16.r, color: Colors.black),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFFF9F9FB))),
                        )),
                    SizedBox(
                      width: 15.r,
                    ),
                    SizedBox(
                        height: 50.r,
                        width: 110.r,
                        child: ElevatedButton(
                          onPressed: () {
                        AppRouter.navigateToScreen(LoginScreen());
                          },
                          child: Text(
                            'log in',
                            style: TextStyle(fontSize: 16.r),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )),
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 64, 62, 204))),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
