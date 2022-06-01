import 'package:flutter/material.dart';

class ButtonDialog extends StatefulWidget {
  ButtonDialog({Key? key}) : super(key: key);

  @override
  State<ButtonDialog> createState() => _ButtonDialogState();
}

class _ButtonDialogState extends State<ButtonDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Button Text",
          /*textAlign: TextAlign.end,*/
        ),
        ButtonBar(
          alignment: MainAxisAlignment.end,
          children: [CloseButton()],
        )
      ]),
      content: SingleChildScrollView(
          child: Row(
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: Text("Button"),
          ),
          SizedBox(width: 10),
          /*MaterialButton(
            onPressed: (() {}),
            child: Text("Button"),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.youtube_searched_for,
              )),*/
          OutlinedButton(onPressed: () {}, child: Text("Button")),
          SizedBox(width: 10),
          TextButton(
            onPressed: () {},
            child: Text("Button"),
          ),
          SizedBox(width: 10),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
        ],
      )),
    );
  }
}
