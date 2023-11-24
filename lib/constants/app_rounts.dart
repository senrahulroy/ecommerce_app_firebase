
import 'package:flutter/material.dart';

class Routes {
  static Routes instance = Routes();

  Future<dynamic> pushAndRemoveUntil(Widget pageName, BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => pageName), (route) => false);
  }

  Future<dynamic> push(Widget pageName, BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (context) => pageName,));
  }

  Future<dynamic> pushReplacement(Widget pageName, BuildContext context) {
    return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => pageName,));
  }

}
