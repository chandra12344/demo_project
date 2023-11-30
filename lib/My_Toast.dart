import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToast{
  static void toast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Color(0xbfFFFFFF),
        textColor: Colors.black,
        fontSize: 16.0
    );
  }
}