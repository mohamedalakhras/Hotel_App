import 'dart:developer';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotelproject/app_rout/rout.dart';
import 'package:hotelproject/screen/Booking/payment/book_details.dart';
import 'package:hotelproject/screen/favorite/favorite_screen.dart';

class Room_details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF1F1F39),
        centerTitle: true,
        title: Text(
          ' Room',
          style:
              TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 0.53),
        ),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(40),
        //   ),
        // ),
        leading: InkWell(
          onTap: () {
            Navigator.of(
              context,
            ).pop();
          },
          child: ImageIcon(
            AssetImage('image_file/home/Back.png'),
            color: Color.fromARGB(255, 241, 239, 239),
            size: 24,
          ),
        ),

        //........... bottom  Appbar..........//
      ),
      body: ListView(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
            color: Color(0XFF1F1F39),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                child: carousel_room(),
                // Image.asset(
                //   "image_file/main/24trending-shophotels1-superJumbo.jpg",
                //   fit: BoxFit.cover,
                // ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
                child: Row(
                  children: [
                    Image.asset(
                      "image_file/main/Icon-24x-Locate.png",
                      color: Color.fromARGB(255, 233, 233, 233),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '23 Sun View Rd, Little Town, CA, 23424',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Image.asset(
                      "image_file/main/Icon-24x-Map.png",
                      color: Color.fromARGB(255, 233, 233, 233),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
                child: Row(
                  children: [
                    Image.asset(
                      "image_file/main/Icon-16x-Bedroom.png",
                      color: Color.fromARGB(255, 233, 233, 233),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Image.asset(
                      "image_file/main/Icon-16x-Bathroom.png",
                      color: Color.fromARGB(255, 233, 233, 233),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Our fancy room with minimalism decoration will make you feel like home! We have an area for cooking and a cafe shop at ground floor. 24/7 security with our guards at front door will make you feel safe all the time.',
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
        ),
        miCard('Ali', '360_F_224869519_aRaeLneqALfPNBzg0xxMZXghtvBXkfIA.jpg',
            'So in love with this room. My host is very friendly and helpful'),
        miCard('Mohamed', 'istockphoto-1319763895-612x612.jpg',
            'The bath need fixing soon'),
        miCard('Anas', 'istockphoto-1335941248-170667a.jpg',
            'I’m quite confident that every people with love this place like I do'),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0XFF1F1F39),
          ),
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          height: 50,
          width: double.infinity,
          child: Row(
            children: [
              InkWell(
                child: Image.asset('image_file/home/Iconly-Bold-Saved.png'),
                onTap: () async {
                  AppRouter.showto_ok_Diaoug(
                      'Add to your favorited', Favorite());
                  // AppRouter.navigateToScreen(Favorite());
                },
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromARGB(255, 28, 29, 31)),
                  height: 40,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: (() {
                        AppRouter.navigateToScreen(Booking_details());
                      }),
                      child: Text(
                        'Book Now',
                        style: TextStyle(fontSize: 18),
                      )))
            ],
          ),
        )
      ]),
    );
  }
}

//...............card_widget.................//

Card miCard(
  String name,
  String image,
  String text,
) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(15),
    elevation: 5,
    child: Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(name),
          subtitle: Text(" ${text}"),
          leading: CircleAvatar(
            backgroundImage: AssetImage('image_file/main/${image}'),
            // child: Image.asset('image_file/main/${image}'),
            radius: 25,
          ),
        ),
      ],
    ),
  );
}
//..............CarouselSlider_widget.....................//

class carousel_room extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: [
        Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: AssetImage("image_file/home/Rectangle 36.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: AssetImage("image_file/home/Rectangle -1.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: AssetImage("image_file/home/Rectangle -2.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
