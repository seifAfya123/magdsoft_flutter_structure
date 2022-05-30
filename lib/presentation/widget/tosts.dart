import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Tosts {
  void errorTosta(String txt) {
    Fluttertoast.showToast(
      msg: txt,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void goodTosta(String txt) {
    Fluttertoast.showToast(
      msg: txt,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}
