import 'dart:convert';

import 'package:afterdrawing/src/constants/apisUrl.dart';
import 'package:afterdrawing/src/model/CreateProjectDto.dart';
import 'package:afterdrawing/src/model/ProjectDto.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProjectProvider {
  Future<List<ProjectDto>> getAllProjectsByUser() async {
    final prefs = await SharedPreferences.getInstance();

    var userId = prefs.getInt("userId") ?? 0;
    String url = '$urlBackendApi/users/${userId}/projects';

    Uri uri = Uri.parse(url);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(response.body)['content'] as List;
      List<ProjectDto> projects = [];

      jsonResponse.forEach((element) {
        var project = ProjectDto.fromJson(element);
        projects.add(project);
      });

      return projects;
    } else {
      return Future.error("Internal Server Error");
    }
  }

  Future<bool> createProject(CreateProjectDto createProjectDto) async {
    final prefs = await SharedPreferences.getInstance();

    var userId = prefs.getInt("userId") ?? 0;

    var url = '$urlBackendApi/users/${userId}/projects';

    Uri uri = Uri.parse(url);

    var body = createProjectDto.toJson();

    var response = await http.post(uri, body: json.encode(body), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProject(
      CreateProjectDto createProjectDto, projectId) async {
    final prefs = await SharedPreferences.getInstance();

    var userId = prefs.getInt("userId") ?? 0;

    var url = '$urlBackendApi/users/${userId}/projects/$projectId';

    Uri uri = Uri.parse(url);

    var body = createProjectDto.toJson();

    var response = await http.put(uri, body: json.encode(body), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProject(projectId) async {
    final prefs = await SharedPreferences.getInstance();

    var userId = prefs.getInt("userId") ?? 0;

    var url = '$urlBackendApi/users/${userId}/projects/$projectId';

    Uri uri = Uri.parse(url);

    //var body = createProjectDto.toJson();

    var response = await http.delete(
      uri, /*headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    }*/
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
