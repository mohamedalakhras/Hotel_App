import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelproject/providers/provider.dart';
import 'package:hotelproject/screen/main_screen/botombar.dart';
import 'package:hotelproject/screen/main_screen/profile.dart';
 
import 'package:provider/provider.dart';

class Home_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Consumer<AuthProvider>(builder: ((context, provider, child) {
    return Scaffold(
      drawer: Profile(),
      bottomNavigationBar: Bottom_bar(),
    );
    // }));
  }
}

//    appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 122, 116, 131),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.zero,
//             topRight: Radius.zero,
//             bottomLeft: Radius.circular(50.0),
//             bottomRight: Radius.zero,
//           ),
//         ),
//         leading: InkWell(
//           onTap: () {},
//           child: Icon(
//             Icons.subject,
//             color: Colors.white,
//           ),
//         ),
//         actions: [
//           InkWell(
//             onTap: () {},
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(
//                 Icons.notifications,
//                 size: 20,
//               ),
//             ),
//           ),
//         ],
//         flexibleSpace: Text(
//           'test',
//           style: TextStyle(color: Colors.white),
//         ),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(120),
//           child: Container(
//             margin: const EdgeInsets.fromLTRB(45, 0, 80, 30),
//             child: TextFormField(
//               decoration: InputDecoration(
//                   suffixIcon: IconButton(
//                       onPressed: (() {}),
//                       icon: Image.asset('image_file/home/Icon-16x-Search.png')),
//                   hintText: 'loking for room',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15))),
//             ),
//           ),
//         ),
//       ),

// Widget getAppBottomView() {
//   return Container(
//     padding: EdgeInsets.only(left: 30, bottom: 20),
//     child: Row(
//       children: [
//         TextField(
//           style: TextStyle(fontSize: 20),
//           decoration: InputDecoration(
//             label: Text('data'),
//             hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent),
//             border: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.teal,
//               ),
//             ),
//             prefixIcon: const Icon(
//               Icons.security,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget getProfileView() {
//   return Stack(
//     children: [
//       CircleAvatar(
//         radius: 32,
//         backgroundColor: Colors.white,
//         child: Icon(Icons.person_outline_rounded),
//       ),
//       Positioned(
//           bottom: 1,
//           right: 1,
//           child: Container(
//             height: 30,
//             width: 30,
//             child: Icon(
//               Icons.edit,
//               color: Colors.deepPurple,
//               size: 20,
//             ),
//             decoration: BoxDecoration(
//                 color: Colors.amber,
//                 borderRadius: BorderRadius.all(Radius.circular(20))),
//           ))
//     ],
//   );
// }
