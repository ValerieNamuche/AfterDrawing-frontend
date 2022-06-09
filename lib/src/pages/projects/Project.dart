// ignore_for_file: deprecated_member_use

import 'package:afterdrawing/src/core/bloc/projectBloc.dart';
import 'package:afterdrawing/src/utils/SnackBarNotification.dart';
import 'package:afterdrawing/src/utils/Utils.dart';
import 'package:afterdrawing/src/widgets/dialog_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ProjectDetails.dart';

//Class Project with title and description
class Project {
  final String title;
  final String description;
  final int ninterfaces;

  Project(this.title, this.description, this.ninterfaces);
}

//Use the Project class to create a list of projects
List<Project> projects = [
  Project('Project 1', 'Description 1', 5),
  Project('Project 2', 'Description 2', 5),
  Project('Project 3', 'Description 3', 5),
  Project('Project 4', 'Description 4', 5),
  Project('Project 5', 'Description 5', 5),
  Project('Project 6', 'Description 6', 5),
  Project('Project 7', 'Description 7', 5),
  Project('Project 8', 'Description 8', 5),
  Project('Project 9', 'Description 9', 5),
  Project('Project 10', 'Description 10', 5),
];

// Create a class that will be used to create a list of projects
class ProjectList extends StatefulWidget {
  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  ProjectBloc projectBloc = ProjectBloc();

  @override
  void initState() {
    projectBloc.getProjects();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Projects'),
      ),*/
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Text(
              'Mis Projectos',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 15, bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return DialogCreateProject(
                        projectBloc: projectBloc,
                      );
                    });
              },
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(18)),
              child: Text('Crear proyecto +'),
            ),
          ),
          StreamBuilder(
              stream: projectBloc.projectsStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var projectsData = snapshot.data as List;
                  /////
                  return Expanded(
                    child: projectsData.length > 0
                        ? ListView.builder(
                            itemCount: projectsData.length,
                            itemBuilder: (context, index) {
                              //elevation: 6,
                              return Card(
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, top: 5, bottom: 5),
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(10),
                                  leading: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'lib/src/images/wireframelogo.png')),
                                  title: Text(projectsData[index].title),
                                  trailing: IconButton(
                                    color: Colors.red,
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      DeleteDialog(projectsData[index].id);
                                    },
                                  ),
                                  onTap: () {
                                    Utils.homeNavigator.currentState!.pushNamed(
                                        'project_details',
                                        arguments: projectsData[index]);
                                  },
                                ),
                              );
                            },
                          )
                        : Center(child: Text("No posee ningun proyecto")),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Container(
                    width: 400,
                    height: 550,
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                } else {
                  return Center(
                    child: Text("Error con el servidor"),
                  );
                }
              }),
          Padding(
              padding: EdgeInsets.only(left: 20, top: 15, bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return DialogCreateProject();
                      });
                },
                style: ElevatedButton.styleFrom(padding: EdgeInsets.all(18)),
                child: Text('Crear proyecto +'),
              )),
        ],
      ),
    );
  }

  DeleteDialog(projectId) {
    return showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text("Eliminar Proyecto"),
            content: Text("¿Seguro que quieres eliminar este proyecto?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    projectBloc.deleteProject(projectId).then((value) {
                      if (value == true) {
                        SnackBarNotification().showSnackbar(
                            Utils.homeNavigator.currentContext!,
                            "Se eliminó el proyecto seleccionado",
                            "success");
                        print("Proyecto eliminado");
                      } else {
                        SnackBarNotification().showSnackbar(
                            Utils.homeNavigator.currentContext!,
                            "Ocurrió un error en el server",
                            "error");
                        print("Error en server");
                      }
                    });
                  },
                  child: Text(
                    "Si",
                    style: TextStyle(color: Colors.red),
                  )),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Text("No"),
              )
            ],
          );
        });
  }
}

// Create a class that will be used to create a project detail page
class ProjectDetail extends StatelessWidget {
  final Project project;

  ProjectDetail(this.project);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
      ),
      // the project description and image will be displayed in a card and two buttons will be displayed in a row at the bottom of the page
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(project.description),
            const SizedBox(height: 16.0),
            Image.asset(
              // the image will be displayed in the center of the page with a width of 300 and a height of 300 pixels

              'lib/src/images/interfaceprueba.png',
              //set size of image
              width: 500,
              height: 500,
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // the first button will be used to go to generate interface
                RaisedButton(
                  child: const Text('Generate Interface'),
                  onPressed: () {
                    /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InterfaceGenerator(),
                      ),
                    ); */
                  },
                  // set the color of the button and the text
                  color: Colors.blue,
                  textColor: Colors.white,
                  animationDuration: const Duration(milliseconds: 500),
                  //size of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  //position of the button in the left side of the page
                  padding: const EdgeInsets.all(15.0),
                ),
                // the second button will be used to see all the interfaces generated
                RaisedButton(
                  child: const Text('See All Interfaces'),
                  onPressed: () {
                    /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InterfaceList(),
                      ),
                    ); */
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  animationDuration: const Duration(milliseconds: 500),
                  //size of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  //position of the button in the right side of the page
                  padding: const EdgeInsets.all(15.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// End of Project.dart
