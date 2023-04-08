import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelproject/app_rout/rout.dart';
import 'package:hotelproject/providers/provider.dart';
import 'package:hotelproject/screen/register/register-widget.dart';
import 'package:hotelproject/screen/register/register.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: ((context, provider, child) {
      return Form(
        key: formstate,
        child: Scaffold(
            backgroundColor: Color(0xFF1F1F39),
            appBar: AppBar(
              backgroundColor: Color(0xFF1F1F39),
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(74.r),
                child: Column(
                  children: [
                    Image.asset(
                      "image_file/any_screen/R.png",
                      height: 35.r,
                      width: 44.r,
                    ),
                    SizedBox(
                      height: 10.r,
                    ),
                    Image.asset("image_file/any_screen/Rentee.png",
                        height: 17.r, width: 68.r, color: Colors.white),
                  ],
                ),
              ),
            ),
            body: ListView(
              children: [
                Container(
                  height: 415.r,
                  width: 311.r,
                  margin: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                  padding: EdgeInsets.all(23),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Column(children: [
                    CustomTextformfield(provider.loginEmailCOntroller, 'Email'),
                    CustomTextformfield(
                        provider.loginPasswordCOntroller, 'Password'),
                    Container(
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 15.r,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot your bassword',
                            style: TextStyle(
                                fontSize: 13.r, color: Color(0xFF3845AB)),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                          height: 50,
                          width: 184,
                          child: ElevatedButton(
                            onPressed: () {
                              provider.login();
                            },
                            child: Text(
                              'sign in',
                              style: TextStyle(fontSize: 16.r),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 64, 62, 204))),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30.r, 0.r, 20.r, 25.r),
                      child: Row(
                        children: [
                          Text(
                            'Dont have an account?',
                            style: TextStyle(fontSize: 13.r),
                          ),
                          TextButton(
                              onPressed: (() {
                                AppRouter.navigateToScreen(RegisterScreen());
                              }),
                              child: Text('Sign up'))
                        ],
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  child: Image.asset(
                    "image_file/any_screen/8.png",
                    fit: BoxFit.contain,
                  ),
                  height: 95.r,
                  width: double.infinity,
                )
              ],
            )),
      );
    }));
  }
}





// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Consumer<AuthProvider>(
//         builder: (context, provider, x) {
//           return Column(
//             children: [
//               CustomTextfield(provider.loginEmailCOntroller, 'Email'),
//               CustomTextfield(provider.loginPasswordCOntroller, 'Password'),
//               ElevatedButton(
//                   onPressed: () {
//                     provider.login();
//                   },
//                   child: Text('Login')),
//               ElevatedButton(
//                   onPressed: () {
//                     AppRouter.navigateAndReplaceScreen(RegisterScreen());
//                   },
//                   child: Text('Create new Account')),
//               ElevatedButton(onPressed: () {}, child: Text('firestore test'))
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
