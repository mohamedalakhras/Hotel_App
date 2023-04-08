import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  String? selectedValue;

  List<String> items = ['Excepteur sint occaecat non proiden '];

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
                    '   Support   ',
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
                      'Call',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: ((context) {
                      //   return Chat();
                      // })));

                      ////................................//
                      _launcWhatsapp();
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
                      'Chat',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 253, 253, 253)),
                    ),
                    onPressed: () {
                      launch(
                          'mailto:rajatrrpalankar@gmail.com?subject=This is Subject Title&body=This is Body of Email');
                    },
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0XFFEEA86C)),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                      color: Color.fromARGB(255, 218, 218, 218), width: 0)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  dropdownElevation: 0,
                  buttonElevation: 0,
                  itemPadding: EdgeInsets.all(30.0),
                  dropdownWidth: double.infinity,
                  buttonHeight: 50,
                  buttonWidth: 100,
                  itemHeight: 100,
                  hint: Text(
                    'Lorem ipsum dolor sit amet',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    // setState(() {
                    //   selectedValue = value as String;
                    // });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                      color: Color.fromARGB(255, 218, 218, 218), width: 0)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  iconSize: 32,
                  focusColor: Color.fromARGB(255, 187, 231, 245),
                  dropdownElevation: 0,
                  buttonElevation: 0,
                  itemPadding: EdgeInsets.all(30.0),
                  dropdownWidth: double.infinity,
                  hint: Text(
                    'Quis varius quam quisque id diam',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                '',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    // setState(() {
                    //   selectedValue = value as String;
                    // });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                      color: Color.fromARGB(255, 218, 218, 218), width: 0)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  iconSize: 32,
                  focusColor: Color.fromARGB(255, 187, 231, 245),
                  dropdownElevation: 0,
                  buttonElevation: 0,
                  itemPadding: EdgeInsets.all(30.0),
                  dropdownWidth: double.infinity,
                  hint: Text(
                    'Etiam sit amet nisl purus',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                '',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    // setState(() {
                    //   selectedValue = value as String;
                    // });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                      color: Color.fromARGB(255, 218, 218, 218), width: 0)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  iconSize: 32,
                  focusColor: Color.fromARGB(255, 187, 231, 245),
                  dropdownElevation: 0,
                  buttonElevation: 0,
                  itemPadding: EdgeInsets.all(30.0),
                  dropdownWidth: double.infinity,
                  hint: Text(
                    'Etiam sit amet nisl purus',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                '',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    // setState(() {
                    //   selectedValue = value as String;
                    // });
                  },
                ),
              ),
            ),
          ]),
        ));
  }
}

//......................................//

// class _dropdownState extends StatelessWidget {
//   @override
//   String? selectedValue;

//   List<String> items = ['Item1'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton2(
//             dropdownWidth: 220,
//             buttonHeight: 40,
//             buttonWidth: 220,
//             itemHeight: 220,
//             hint: Text(
//               'Select Item',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.black,
//               ),
//             ),
//             items: items
//                 .map((item) => DropdownMenuItem<String>(
//                       value: item,
//                       child: Text(
//                         item,
//                         style: const TextStyle(
//                           fontSize: 14,
//                         ),
//                       ),
//                     ))
//                 .toList(),
//             value: selectedValue,
//             onChanged: (value) {
//               setState(() {
//                 selectedValue = value as String;
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
