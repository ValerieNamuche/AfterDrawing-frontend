import 'package:afterdrawing/my_home_page.dart';
import 'Text_box.dart';
import 'package:flutter/material.dart';

class RegisterProject extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterProject();
}

class _RegisterProject extends State<RegisterProject> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registrar Proyectos"),
        ),
        body: ListView(
          children: [
            TextBox(controllerTitle, "Nombre"),
            TextBox(controllerDescription, "Apellido"),
            ElevatedButton(
                onPressed: () {
                  String title = controllerTitle.text;
                  String description = controllerDescription.text;

                  if (title.isNotEmpty && description.isNotEmpty) {
                    Navigator.pop(context,
                        Project(title: title, description: description));
                  }
                },
                child: Text("Guardar Proyecto")),
          ],
        ));
  }
}
