import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';

messageResponse(BuildContext context, String name) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Mensaje Informativo...!"),
            content: Text("El cliente " + name),
          ));
}
