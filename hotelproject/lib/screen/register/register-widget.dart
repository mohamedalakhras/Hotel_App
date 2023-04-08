import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  TextEditingController controller;
  String label;
  CustomTextformfield(this.controller, this.label);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: TextFormField(
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
        },
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}


// class Text_filde extends StatelessWidget {
//   String ldata = '';
//   String labldata = '';
//   TextEditingController controller;
//   Text_filde(this.ldata, this.labldata, this.controller);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 10,
//         ),
//         Text(ldata),
//         SizedBox(
//           height: 10,
//         ),
//         TextFormField(
//           controller: controller,
//           validator: (String? x) {
//             if (x == null || x.isEmpty) {
//               return "this field is required";
//             }
//           },
//           decoration: InputDecoration(
//               hintText: labldata,
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
//         ),
//         SizedBox(
//           height: 5,
//         ),
//       ],
//     );
//   }
// }
