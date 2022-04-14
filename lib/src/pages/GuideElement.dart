import 'package:flutter/material.dart';

//Create a GridView of 6 elements
class GuideElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          child: Image.asset('lib/src/images/fondohome2osi.png'),
        ),
        Container(
          child: Image.asset('lib/src/images/fondohome2osi.png'),
        ),
        Container(
          child: Image.asset('lib/src/images/fondohome2osi.png'),
        ),
        Container(
          child: Image.asset('lib/src/images/fondohome2osi.png'),
        ),
        Container(
          child: Image.asset('lib/src/images/fondohome2osi.png'),
        ),
        Container(
          child: Image.asset('lib/src/images/fondohome2osi.png'),
        ),
      ],
    );
  }
}
