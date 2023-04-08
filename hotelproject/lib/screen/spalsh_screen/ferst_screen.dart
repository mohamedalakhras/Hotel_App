import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelproject/app_rout/rout.dart';
import 'package:hotelproject/providers/provider.dart';
import 'package:hotelproject/screen/spalsh_screen/tow_screen.dart';
import 'package:provider/provider.dart';

class spalsh_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.white),
      body: Column(
        children: [
          Container(
            child: Image.asset(
              "image_file/any_screen/2screen.png",
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
                  "Choos form a      thousand of places",
                  style: TextStyle(fontSize: 25.r, color: Color(0xff3845AB)),
                ),
                SizedBox(
                  height: 15.r,
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
                  height: 20.r,
                ),
                Text(
                  "We provide you with a variant of   accomodaion for a better choice",
                  style: TextStyle(fontSize: 14.r),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 8.r,
                  width: 25.r,
                ),
                SizedBox(
                  height: 35.r,
                ),
                SizedBox(
                    height: 50.r,
                    width: 132.r,
                    child: ElevatedButton(
                      onPressed: () {
                        AppRouter.navigateToScreen(Tow_screen());
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Tow_screen();
                        // }));
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 16.r),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 64, 62, 204))),
                    ))
              ],
            ),
          ),
        ],
      ),
      //  appBar: AppBar(),
      // body: Column(
      //   children: [
      //     Column(
      //       children: [
      //         Container(
      //           child: Image.asset(
      //             "image_file/screen/Vector.png",
      //             fit: BoxFit.cover,
      //           ),
      //           width: double.infinity,
      //           height: 470.r,
      //         ),
      //         Mar
      //         ,
      //         Column(

      //           children: [
      //             Text(
      //               "Choos form a thousand of places",
      //               style: TextStyle(fontSize: 28.r),
      //             ),
      //           ],
      //         ),
      //         SizedBox(
      //           height: 10.r,
      //         ),
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
