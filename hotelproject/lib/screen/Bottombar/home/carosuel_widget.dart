import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotelproject/app_rout/rout.dart';
import 'package:hotelproject/screen/Bottombar/home/Room_details/Room_details.dart';

class carousel_widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: [
        InkWell(
          onTap: () {
            AppRouter.navigateToScreen(Room_details());
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage("image_file/home/Rectangle 36.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            AppRouter.navigateToScreen(Room_details());
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage("image_file/home/Rectangle -1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            AppRouter.navigateToScreen(Room_details());
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage("image_file/home/Rectangle -2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
