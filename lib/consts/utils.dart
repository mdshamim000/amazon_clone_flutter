import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// void showSnackBar(BuildContext context, String text) {
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
// }

void showToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black38,
      // color == 1 ? Colors.redAccent[400] : Colors.greenAccent[400],
      textColor: Colors.white,
      fontSize: 22.0);
}
