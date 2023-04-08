import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelproject/providers/provider.dart';
import 'package:provider/provider.dart';

class Splach_sceen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: ((context, value, child) {
      return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 300.r, horizontal: 150.r),
          height: double.infinity,
          width: double.infinity,
          color: Color(0xFF1F1F39),
          child: Column(
            children: [
              Image.asset(
                "image_file/any_screen/R.png",
                height: 80.r,
                width: 60.r,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.r,
              ),
              Image.asset(
                "image_file/any_screen/Rentee.png",
                height: 20.r,
                width: 60.r,
                color: Colors.white,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      );
    }));
  }
}
