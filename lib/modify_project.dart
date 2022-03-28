import 'my_home_page.dart';
import 'package:flutter/material.dart';
import 'text_box.dart';

class ModifyProject extends StatefulWidget {
  final Project _proyecto;
  ModifyProject(this._proyecto);
  @override
  State<StatefulWidget> createState() => _ModifyProject();
}

class _ModifyProject extends State<ModifyProject> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();

  @override
  void initState() {
    Project c = widget._proyecto;
    controllerTitle = TextEditingController(text: c.title);
    controllerDescription = TextEditingController(text: c.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar Proyecto"),
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
                      new Project(title: title, description: description));
                }
              },
              child: Text("Guardar Proyecto")),
        ],
      ),
    );
  }
}
