import 'package:flutter/material.dart';

String uriAndroid = 'http://10.0.2.2:3000'; //android localhost
String uri = 'http://0.0.0.0:3000';

class GlobalVariables {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  static const text18w = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white);
  static const text18b = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black);
}
