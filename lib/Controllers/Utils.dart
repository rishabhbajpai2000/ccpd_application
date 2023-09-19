import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  // this will return todays date in dd/mm/yyyy format.
  static String getTheCurrentDate() {
    DateTime now = DateTime.now();
    String date = now.day.toString() +
        "/" +
        now.month.toString() +
        "/" +
        now.year.toString();
    return date;
  }

  static void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xff3a243b),
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static void showReleventToastMessageForJobPostingAPI(
      {required int statusCode}) {
    if (statusCode == 200)
      Utils.toastMessage("Job Posted Successfully");
    else if (statusCode == 400)
      Utils.toastMessage("Bad Request");
    else if (statusCode == 500)
      Utils.toastMessage("Internal Server Error");
    else
      Utils.toastMessage("Something went wrong");
  }
}
