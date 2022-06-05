import 'package:flutter/material.dart';

class SnackBarNotification {
  void showSnackbar(BuildContext context, String message, String type) {
    Color background = Colors.white;
    if (type == "error") {
      background = Colors.red;
    }
    if (type == "success") {
      background = Colors.green.shade800;
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: background,
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(milliseconds: 1500),
    ));
  }
}
