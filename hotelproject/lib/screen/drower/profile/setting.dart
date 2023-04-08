import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelproject/app_rout/rout.dart';
import 'package:hotelproject/helpers/firestore_helper.dart';
import 'package:hotelproject/providers/provider.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool value = false;

  @override
  GlobalKey<FormState> FormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: ((context, provider, child) {
      return Scaffold(
          body: Form(
              key: FormKey,
              child: ListView(children: [
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
                        'Setting',
                        style: TextStyle(
                            color: Color.fromARGB(255, 243, 241, 241),
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.r,
                ),
                Container(child: Dropdown()),
                SizedBox(
                  height: 00.r,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    MyStatefulWidgetState(),
                    SizedBox(width: 10),
                    Text(
                      ' Booking activities ',
                      style: TextStyle(fontSize: 17.0),
                    ), //Text
                    //Checkbox
                  ], //<Widget>[]
                ), //Ro
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    MyStatefulWidgetState(),
                    SizedBox(width: 10),
                    Text(
                      '  Messages ',
                      style: TextStyle(fontSize: 17.0),
                    ), //Text
                    //Checkbox
                  ], //<Widget>[]
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Text(
                    'Change yoour password',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 10.r,
                ),
                CustomTextfield('  your current password'),
                CustomTextfield('  your New password'),
                CustomTextfield('  Retype your current password'),
                Padding(
                  padding: const EdgeInsets.all(25.0),
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
                            'save',
                            style: TextStyle(
                                fontSize: 20.r, fontWeight: FontWeight.bold),
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
              ])));
    }));
  }
}

class CustomTextfield extends StatelessWidget {
  String label;
  CustomTextfield(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
            },
            decoration: InputDecoration(
                hintText: label,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ],
      ),
    );
  }
}

class MyStatefulWidgetState extends StatefulWidget {
  @override
  State<MyStatefulWidgetState> createState() => MyStatefulWidgetStateState();
}

class MyStatefulWidgetStateState extends State<MyStatefulWidgetState> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color.fromARGB(255, 247, 247, 247);
      }
      return Color.fromARGB(255, 140, 177, 211);
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

//........................//

class Dropdown extends StatefulWidget {
  const Dropdown({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Dropdown> {
  // Initial Selected Value
  String dropdownvalue = 'Arabi';

  // List of items in our dropdown menu
  var items = [
    'Arabi',
    'ENG',
    'frach',
    'indian',
    'koran',
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: Color.fromARGB(255, 233, 232, 232), width: 2)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            focusColor: Colors.white,
            value: dropdownvalue,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            iconSize: 16,

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ),
      ),
    );
  }
}
