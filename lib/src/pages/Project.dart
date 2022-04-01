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
      body: Center(
        child: Text(project.description),
      ),
    );
  }
}
// End of Project.dart
