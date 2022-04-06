import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//Class Project with title and description
class Project {
  final String title;
  final String description;

  Project(this.title, this.description);
}

//Use the Project class to create a list of projects
List<Project> projects = [
  Project('Project 1', 'Description 1'),
  Project('Project 2', 'Description 2'),
  Project('Project 3', 'Description 3'),
  Project('Project 4', 'Description 4'),
  Project('Project 5', 'Description 5'),
  Project('Project 6', 'Description 6'),
  Project('Project 7', 'Description 7'),
  Project('Project 8', 'Description 8'),
  Project('Project 9', 'Description 9'),
  Project('Project 10', 'Description 10'),
];

// Create a class that will be used to create a list of projects
class ProjectList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(projects[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectDetail(projects[index]),
                ),
              );
            },
          );
        },
      ),
    );
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(project.description),
            SizedBox(height: 16.0),
            Image.asset(
              // the image will be displayed in the center of the page with a width of 300 and a height of 300 pixels

              'lib/src/images/interfaceprueba.png',
              //set size of image
              width: 500,
              height: 500,
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // the first button will be used to go to generate interface
                RaisedButton(
                  child: Text('Generate Interface'),
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
                  animationDuration: Duration(milliseconds: 500),
                  //size of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  //position of the button in the left side of the page
                  padding: EdgeInsets.all(15.0),
                ),
                // the second button will be used to see all the interfaces generated
                RaisedButton(
                  child: Text('See All Interfaces'),
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
                  animationDuration: Duration(milliseconds: 500),
                  //size of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  //position of the button in the right side of the page
                  padding: EdgeInsets.all(15.0),
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
