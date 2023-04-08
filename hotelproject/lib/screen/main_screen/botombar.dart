import 'package:flutter/material.dart';
import 'package:hotelproject/screen/Bottombar/home/page1.dart';
import 'package:hotelproject/screen/Bottombar/massege/page2.dart';

import 'package:hotelproject/screen/Booking/booking_page/ongoing.dart';
import 'package:hotelproject/screen/favorite/favorite_screen.dart';

class Bottom_bar extends StatefulWidget {
  const Bottom_bar({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Bottom_bar> {
  int pageIndex = 0;

  final pages = [
    Home_Page(),
    const Page2(),
    Favorite(),
    Ongoing(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 49, 49, 77),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              iconSize: 50,
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? Image.asset(
                      'image_file/home/Unseleted.png',
                      color: Colors.white,
                    )
                  : Image.asset(
                      'image_file/home/Unseleted.png',
                      color: Color(0XFF1F1F39),
                    )),
          IconButton(
              iconSize: 50,
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? Image.asset(
                      'image_file/home/Iconly-Bold-Mail.png',
                      color: Colors.white,
                    )
                  : Image.asset(
                      'image_file/home/Iconly-Bold-Mail.png',
                      color: Color(0XFF1F1F39),
                    )),
          IconButton(
              iconSize: 50,
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? Image.asset(
                      'image_file/home/Iconly-Bold-Saved.png',
                      color: Colors.white,
                    )
                  : Image.asset(
                      'image_file/home/Iconly-Bold-Saved.png',
                      color: Color(0XFF1F1F39),
                    )),
          IconButton(
              iconSize: 50,
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? Image.asset(
                      fit: BoxFit.contain,
                      'image_file/home/Iconly-Bold-Bag.png',
                      color: Colors.white,
                    )
                  : Image.asset(
                      fit: BoxFit.contain,
                      'image_file/home/Iconly-Bold-Bag.png',
                      color: Color(0XFF1F1F39),
                    )),
        ],
      ),
    );
  }
}
