import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({
  required String text,
}) async{
  await Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 20,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    fontSize: 16.0,
  );
}