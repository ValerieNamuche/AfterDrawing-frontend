import 'package:flutter/material.dart';

class InputTextDialog extends StatelessWidget {
  InputTextDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Input Text",
        textAlign: TextAlign.center,
      ),
      content: Container(
        //height: 100,
        width: 400,
        child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: textDecorations.length,
            itemBuilder: (context, index) {
              return TextField(
                decoration: textDecorations[index],
              );
            }),
      ),
    );
  }

  List<InputDecoration> textDecorations = [
    InputDecoration(
        hintText: 'Input Text', hintTextDirection: TextDirection.rtl),
    InputDecoration(
        hintText: 'Input Text', hintTextDirection: TextDirection.ltr),
    InputDecoration(
        hintText: 'Input Text',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        )),
    InputDecoration(
      hintText: 'Input Text',
      filled: true,
      fillColor: Colors.blue.shade200,
    ),
    InputDecoration(
        hintText: 'Input Text',
        filled: true,
        fillColor: Colors.blue.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        )),
  ];
}
