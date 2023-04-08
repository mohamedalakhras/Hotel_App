import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelproject/admin/providers/admin_provider.dart';
import 'package:hotelproject/app_rout/rout.dart';
import 'package:hotelproject/providers/provider.dart';
import 'package:hotelproject/screen/main_screen/botombar.dart';

import 'package:hotelproject/screen/drower/profile/profile_info.dart';
import 'package:hotelproject/screen/main_screen/main_screen.dart';

import 'package:hotelproject/screen/log_in/login_screen.dart';
import 'package:hotelproject/screen/register/register.dart';

import 'package:hotelproject/screen/spalsh_screen/ferst_screen.dart';
import 'package:hotelproject/screen/spalsh_screen/spalch_screen.dart';
import 'package:hotelproject/screen/spalsh_screen/tow_screen.dart';

import 'package:provider/provider.dart';

class Hotel extends StatefulWidget {
  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: ((context, child) {
      designSize:
      Size(375, 812);
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
            create: (context) {
              return AuthProvider();
            },
          ),
          ChangeNotifierProvider<AdminProvider>(
            create: (context) {
              return AdminProvider();
            },
          ),
        ],
        child: MaterialApp(
            navigatorKey: AppRouter.navKey,
            home: //Fisrt_csreen(),
                // Home_screen(),
                Splach_sceen(),
            debugShowCheckedModeBanner: false),
      );
    }));
  }
}
