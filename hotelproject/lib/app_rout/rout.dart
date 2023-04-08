import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navKey = GlobalKey();
  static showLoaderDialog() {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: navKey.currentContext!,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showto_ok_Diaoug(String content, Widget widget) {
    showDialog(
        context: navKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            content: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    AppRouter.navigateToScreen(widget);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ))
            ],
          );
        });
  }

  static hideLoadingDialoug() {
    navKey.currentState!.pop();
  }

  static showCustomDiaoug(String content) {
    showDialog(
        context: navKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            content: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    navKey.currentState!.pop();
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ))
            ],
          );
        });
  }

  static navigateToScreen(Widget widget) {
    navKey.currentState!.push(
      PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => widget,
          transitionDuration: Duration(seconds: 0),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return child;
          }),
    );
  }

  static navigateAndReplaceScreen(Widget widget) {
    navKey.currentState!.pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}

// class Approut {
//   static GlobalKey<NavigatorState> navkey = GlobalKey();

//   static puchfun(Widget screen) {
//     navkey.currentState!.push(MaterialPageRoute(builder: ((
//       context,
//     ) {
//       return screen;
//     })));
//   }
// }
