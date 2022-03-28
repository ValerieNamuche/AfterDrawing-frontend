import 'package:afterdrawing/menssage_response.dart';
import 'package:afterdrawing/register_project.dart';

import 'Text_box.dart';
import 'package:flutter/material.dart';
import 'modify_project.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  MyHomePage(this._title);
  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<Project> projects = [
    Project(title: 'AAAA', description: 'AAAAAA'),
    Project(title: 'BBBBB', description: 'BBBBB'),
    Project(title: 'CCCCC', description: 'CCCCC'),
    Project(title: 'DDDDD', description: 'DDDDDD'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ModifyProject(projects[index])))
                  .then((newContact) {
                if (newContact != null) {
                  setState(() {
                    projects.removeAt(index);

                    projects.insert(index, newContact);

                    messageResponse(
                        context, newContact.name + " a sido modificado...!");
                  });
                }
              });
            },
            onLongPress: () {
              removeProject(context, projects[index]);
            },
            title: Text(projects[index].title),
            subtitle: Text(projects[index].description),
            leading: CircleAvatar(
              child: Text(projects[index].title.substring(0, 1)),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisterProject()))
              .then((newContact) {
            if (newContact != null) {
              setState(() {
                projects.add(newContact);
                messageResponse(
                    context, newContact.name + " a sido guardado...!");
              });
            }
          });
        },
        tooltip: "Agregar Projecto",
        child: Icon(Icons.add),
      ),
    );
  }

  removeProject(BuildContext context, Project project) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Projecto"),
              content: Text(
                  "Esta seguro de eliminar el proyecto " + project.title + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.projects.remove(project);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }
}

// class project constructor title and description with getters and setters
class Project {
  var title;
  var description;

  Project({this.title, this.description});

  getTitle() {
    return title;
  }

  setTitle(String title) {
    this.title = title;
  }

  getDescription() {
    return description;
  }

  setDescription(String description) {
    this.description = description;
  }
}
