import 'package:flutter/material.dart';
import 'package:hotelproject/providers/provider.dart';
import 'package:hotelproject/screen/drower/profile/profile_info.dart';
import 'package:hotelproject/screen/drower/profile/listtile_widget.dart';

import 'package:hotelproject/screen/drower/profile/setting.dart';
import 'package:hotelproject/screen/drower/profile/suport.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: ((context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 44, 44, 88),
          centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(
                fontSize: 17, color: Colors.white, letterSpacing: 0.53),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
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

          bottom: PreferredSize(
            preferredSize: Size.fromHeight(110.0),
            child: Container(
              padding: EdgeInsets.only(left: 30, bottom: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    height: 100,
                    width: 100,
                    child: provider.loggedAppUser!.imageUrl == null
                        ? Icon(Icons.camera)
                        : Image.network(
                            provider.loggedAppUser!.imageUrl!,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ((provider.loggedAppUser!.fname!) +
                              " " +
                              (provider.loggedAppUser!.lname!)),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          ((provider.loggedAppUser!.email!)),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        // Text(
                        //   ((provider.loggedAppUser!.phoneNumber!)),
                        //   style: TextStyle(
                        //     fontSize: 13,
                        //     fontWeight: FontWeight.w500,
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              listtile_widget('personal.png', 'porsonal_info', Personal_info()),
              listtile_widget('S.png', 'Sitting', Setting()),
              listtile_widget('support.png', 'Support', CardWidget()),
              listtile_widget(
                'personal.png',
                'Privacy & Policy',
                ElevatedButton(
                  onPressed: () {
                    launch('https://www.marriott.com/about/privacy.mi');
                  },
                  child: Text("Open a URL"),
                ),
                // InkWell(onTap: () {
                //    launch('https://www.marriott.com/about/privacy.mi');
                // },)
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 211, 211),
                      shape: BoxShape.circle),
                  child: ImageIcon(
                    AssetImage('image_file/home/Sign out.png'),
                    color: Color.fromARGB(255, 61, 59, 59),
                    size: 24,
                  ),
                ),
                title: Text(
                  'Sign out',
                  style: TextStyle(fontSize: 19),
                ),
                onTap: (() {
                  Provider.of<AuthProvider>(context, listen: false).signOut();
                }),
              ),
            ],
          ),
        ),
      );
    }));
  }

//.......................widget................................//

//.......................widget................................//

  // Widget getAppBottomView() {
  //   return Container(
  //     padding: EdgeInsets.only(left: 30, bottom: 20),
  //     child: Row(
  //       children: [
  //         getProfileView(),
  //         Container(
  //           margin: EdgeInsets.only(left: 20),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //               ((provider.loggedAppUser!.fname!) +
  //                                 " " +
  //                                 (provider.loggedAppUser!.lname!)),
  //                             provider.profileUserNameController,
  //                 style: TextStyle(
  //                     fontSize: 22,
  //                     fontWeight: FontWeight.w700,
  //                     color: Colors.white),
  //               ),
  //               Text(
  //                 ((provider.loggedAppUser!.email!)),
  //                             provider.profileEmailController,
  //                 style: TextStyle(
  //                   fontSize: 13,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //               // Text(
  //               //   '123456789',
  //               //   style: TextStyle(
  //               //     fontSize: 13,
  //               //     color: Colors.white,
  //               //   ),
  //               // ),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

//   Widget getProfileView() {
//     return Stack(
//       children: [
//         CircleAvatar(
//           radius: 40,
//           backgroundColor: Colors.white,
//           child:  provider.loggedAppUser!.imageUrl!,
//         ),
//         Positioned(
//             bottom: 3,
//             right: 0,
//             child: Container(
//               height: 30,
//               width: 30,
//               child: Icon(
//                 Icons.edit,
//                 color: Colors.deepPurple,
//                 size: 20,
//               ),
//               decoration: BoxDecoration(
//                   color: Colors.amber,
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//             ))
//       ],
//     );
//   }
// }
}
