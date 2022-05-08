import 'package:afterdrawing/router.dart';
import 'package:afterdrawing/src/pages/Home.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  //Este es el que voy a utilizar
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Icono"),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "generate_interfaces1");
                },
                child: Text("Generador")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "guide");
                },
                child: Text("Guía"))
          ],
        )
      ],
    );
  }
}
