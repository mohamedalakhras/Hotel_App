import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelproject/screen/Bottombar/home/Room_details/Room_details.dart';
import 'package:hotelproject/screen/Bottombar/home/card_widget.dart';

class Booking_details extends StatefulWidget {
  @override
  State<Booking_details> createState() => _Booking_detailsState();
}

class _Booking_detailsState extends State<Booking_details> {
  GlobalKey<FormState> FormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: FormKey,
        child: ListView(children: [
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
                  'Booking',
                  style: TextStyle(
                      color: Color.fromARGB(255, 243, 241, 241), fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 00),
            child: Column(
              children: [
                Card_widget('Rectangle 36.png', Room_details()),
                SizedBox(
                  height: 10,
                ),
                CustomTextfield_booking(
                    'Eg: 12:00 am', 'Booking time', 'Icon-16x-Time.png'),
                CustomTextfield_booking(
                    '12/12/2021', 'Booking Date', 'Icon-16x-Date.png'),
                CustomTextfield_booking(
                    '2', 'Number of guest', 'Icon-16x-Date.png'),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                  child: SizedBox(
                      height: 40,
                      width: 250,
                      child: ElevatedButton(
                          onPressed: () {
                            bool isValid = FormKey.currentState!.validate();
                            if (isValid) {
                              // provider.updateUserInfo();
                            }
                          },
                          child: Text(
                            'Book',
                            style: TextStyle(
                                fontSize: 17.r, fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0XFF3845AB)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ))))),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

//......................//
class CustomTextfield_booking extends StatelessWidget {
  bool value = false;
  String label;
  String data;
  String image;
  CustomTextfield_booking(this.label, this.data, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data,
            style: TextStyle(
              fontSize: 15.r,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Index';
              }
            },
            decoration: InputDecoration(
                prefixIcon: Image.asset('image_file/main/${image}'),
                hintText: label,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ],
      ),
    );
  }
}
