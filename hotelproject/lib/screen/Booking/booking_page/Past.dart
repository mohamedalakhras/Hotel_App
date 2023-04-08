import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelproject/app_rout/rout.dart';
import 'package:hotelproject/screen/Bottombar/home/Room_details/Room_details.dart';

import 'package:hotelproject/screen/Bottombar/home/card_widget.dart';

class Past extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          padding: EdgeInsets.fromLTRB(30.r, 0.r, 0.r, 0.r),
          height: 110.r,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0XFF1F1F39),
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
                'Your Bast',
                style: TextStyle(
                    color: Color.fromARGB(255, 243, 241, 241), fontSize: 20),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  width: 150.r,
                  height: 50.r,
                  child: TextButton(
                    child: Text(
                      'Ongoing',
                      style: TextStyle(fontSize: 17, color: Color(0XFF78829D)),
                    ),
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pop();
                    },
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 206, 216, 224)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  width: 150.r,
                  height: 50.r,
                  child: TextButton(
                    child: Text(
                      ' Past ',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    onPressed: () {},
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0XFF3845AB)),
                ),
              ],
            ),
            Card_widget('Rectangle 36.png', Room_details()),
            Card_widget('Rectangle -1.png', Room_details()),
          ],
        )
      ]),
    );
  }
}
