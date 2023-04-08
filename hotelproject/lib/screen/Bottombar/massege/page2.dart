import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:url_launcher/url_launcher.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launcWhatsapp() async {
    if (!await launchUrl(Uri.parse("tel:123456789"))) {
      throw 'Could not launch Whats app';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
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
                      // Navigator.of(
                      //   context,
                      // ).pop();
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
                    'Message',
                    style: TextStyle(
                        color: Color.fromARGB(255, 243, 241, 241),
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  width: 150.r,
                  height: 50.r,
                  child: TextButton(
                    child: Text(
                      'chat2',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: ((context) {
                      //   return Chat();
                      // })));

                      ////................................//
                      //  _launcWhatsapp();
                    },
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0XFF3845AB)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  width: 150.r,
                  height: 50.r,
                  child: TextButton(
                    child: Text(
                      'chat2',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 120, 186, 202)),
                    ),
                    onPressed: () {},
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 206, 216, 224)),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 100,
              height: 100,
              child: Image.asset('image_file/home/Frame.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      _launcWhatsapp();
                    },
                    icon: Icon(Icons.save), //icon data for elevated button
                    label: Text("Elevated Button with Icon"), //label text
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      launch(
                          'sms:+91888888888?body=Hi Welcome to Proto Coders Point');
                    },
                    icon: Icon(Icons.save), //icon data for elevated button
                    label: Text("   Send A SMS   "), //label text
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      launch(
                          'mailto:rajatrrpalankar@gmail.com?subject=This is Subject Title&body=This is Body of Email');
                    },
                    icon: Icon(Icons.save), //icon data for elevated button
                    label: Text("  Send A Email  "), //label text
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      launch('https://protocoderspoint.com/');
                    },
                    icon: Icon(Icons.save), //icon data for elevated button
                    label: Text("   Open a URL   "), //label text
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
