import 'package:flutter/material.dart';

class listtile_widget extends StatelessWidget {
  String image;
  String texts;
  Widget Nav;

  listtile_widget(this.image, this.texts, this.Nav);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 211, 211),
                shape: BoxShape.circle),
            child: ImageIcon(
              AssetImage('image_file/home/$image'),
              color: Color.fromARGB(255, 78, 65, 65),
              size: 24,
            ),
          ),
          title: Text(
            " $texts",
            style: TextStyle(fontSize: 19.0),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
              return Nav;
            })));
          },
          trailing: const ImageIcon(
            AssetImage('image_file/home/1.png'),
            color: Color.fromARGB(255, 97, 84, 84),
            size: 24,
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
