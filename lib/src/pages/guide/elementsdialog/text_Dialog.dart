import 'package:flutter/material.dart';

class TextDialog extends StatelessWidget {
  TextDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Text',
        textAlign: TextAlign.center,
      ),
      content: Container(
        width: 400,
        //height: 400,
        child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: textStyleslist.length,
            itemBuilder: (context, index) {
              return Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                style: textStyleslist[index],
              );
            }),
      ),
    );
  }

  List<TextStyle> textStyleslist = [
    TextStyle(
      fontFamily: 'Arial',
      backgroundColor: Colors.blueAccent,
      decoration: TextDecoration.overline,
    ),
    const TextStyle(
        fontFamily: 'Cardo',
        backgroundColor: Colors.yellowAccent,
        decoration: TextDecoration.underline,
        decorationThickness: 2,
        fontStyle: FontStyle.italic),
    TextStyle(
        fontFamily: 'Milonga',
        color: Colors.green[800],
        backgroundColor: Colors.grey[350],
        decoration: TextDecoration.lineThrough,
        fontWeight: FontWeight.bold),
    const TextStyle(
      fontFamily: 'Raleway Dots',
      //backgroundColor: Colors.blueAccent,
      decorationStyle: TextDecorationStyle.dotted,
      decoration: TextDecoration.underline,
    ),
    const TextStyle(fontFamily: 'League Gothic', shadows: [
      Shadow(color: Colors.deepPurple, blurRadius: 1, offset: Offset(-5, 5))
    ]),
  ];
}
