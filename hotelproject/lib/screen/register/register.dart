import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelproject/app_rout/rout.dart';
import 'package:hotelproject/providers/provider.dart';
import 'package:hotelproject/screen/log_in/login_screen.dart';
import 'package:hotelproject/screen/register/register-widget.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: ((context, Provider, x) {
      return Scaffold(
          backgroundColor: Color(0xFF1F1F39),
          body: Padding(
              padding: const EdgeInsets.fromLTRB(32, 20, 32, 50),
              child: Form(
                key: formkey,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView(children: [
                    Column(
                      children: [
                        Image.asset(
                          "image_file/any_screen/R.png",
                          height: 35.r,
                          width: 46.r,
                        ),
                        SizedBox(
                          height: 10.r,
                        ),
                        Image.asset("image_file/any_screen/Rentee.png",
                            height: 25.r, width: 85.r, color: Colors.white),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      height: 538.r,
                      width: 311.r,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(24.r),
                        child: Column(
                          children: [
                            CustomTextformfield(
                                Provider.registerfnameCOntroller, 'first name'),
                            CustomTextformfield(
                                Provider.registerlnameCOntroller, 'last name'),
                            CustomTextformfield(
                                Provider.registerPhoneCOntroller,
                                'phone number'),
                            CustomTextformfield(
                                Provider.registerEmailCOntroller, 'Email'),
                            CustomTextformfield(
                                Provider.registerPasswordCOntroller,
                                'Password'),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50.r,
                              width: 184.r,
                              child: ElevatedButton(
                                  onPressed: (() {
                                    bool isvalid =
                                        formkey.currentState!.validate();
                                    if (isvalid) {
                                      Provider.register();
                                    }
                                  }),
                                  child: Text('sign up'),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromARGB(255, 64, 62, 204)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14))))),
                            ),
                            SizedBox(
                              height: 10.r,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Alresdy have an account?',
                                  style: TextStyle(fontSize: 14.r),
                                ),
                                TextButton(
                                  onPressed: () {
                                    bool isValid =
                                        formkey.currentState!.validate();
                                    if (isValid) {
                                      AppRouter.navigateToScreen(LoginScreen());
                                    }
                                  },
                                  child: Text(
                                    'sign in',
                                    style: TextStyle(fontSize: 14.r),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Image.asset(
                        "image_file/any_screen/8.png",
                        fit: BoxFit.contain,
                      ),
                      height: 95.r,
                      width: double.infinity,
                    )
                  ]),
                ),
              )));
    }));
  }
}





// class RegisterScreen extends StatelessWidget {
//   GlobalKey<FormState> formstat = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formstat,
//       child: Scaffold(
//         appBar: AppBar(),
//         body: Consumer<AuthProvider>(
//           builder: (context, provider, x) {
//             return Column(
//               children: [
//                 CustomTextfield(provider.registerfnameCOntroller, 'first name'),
//                 CustomTextfield(provider.registerlnameCOntroller, 'last name'),
//                 CustomTextfield(
//                     provider.registerPhoneCOntroller, 'phone number'),
//                 CustomTextfield(provider.registerEmailCOntroller, 'Email'),
//                 CustomTextfield(
//                     provider.registerPasswordCOntroller, 'Password'),
//                 ElevatedButton(
//                     onPressed: () {
//                       provider.register();
//                     },
//                     child: Text('Register'))
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }