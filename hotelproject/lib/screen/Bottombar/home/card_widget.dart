import 'package:flutter/material.dart';
import 'package:hotelproject/app_rout/rout.dart';

class Card_widget extends StatelessWidget {
  String imageroom;
  Widget widget;
  Card_widget(this.imageroom, this.widget);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Color.fromARGB(255, 236, 236, 236),
      shadowColor: Color.fromARGB(255, 255, 255, 255),
      child: Row(
        children: [
          InkWell(
            onTap: (() {
              AppRouter.navigateToScreen(widget);
            }),
            child: Container(
              height: 100,
              width: 110,
              child: Image.asset("image_file/home/${imageroom}"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Biue vibe Room'),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    height: 30,
                    width: 90,
                    child: Text(' 12.5/1hours'),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  Text('1.2km')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: ImageIcon(
                      AssetImage("image_file/home/Icon-16x-Bedroom.png"),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  InkWell(
                    onTap: () {},
                    child: ImageIcon(
                      AssetImage("image_file/home/Icon-16x-Bathroom.png"),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  InkWell(
                    onTap: () {},
                    child: ImageIcon(
                      AssetImage(
                        "image_file/home/Icon-16x-Star.png",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
