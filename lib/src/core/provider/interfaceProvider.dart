import 'dart:convert';

import 'package:afterdrawing/src/model/InterfaceDto.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InterfaceProvider {
  Future<List<InterfaceDto>> getAllInterfacesByProjectId(int projectId) async {
    var url = 'http://localhost:8081/api/projects/${projectId}/interfaces';

    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(response.body)['content'] as List;
      List<InterfaceDto> interfaces = [];

      jsonResponse.forEach((element) {
        var interface = InterfaceDto.fromJson(element);
        interfaces.add(interface);
      });

      return interfaces;
    } else {
      return Future.error("Internal server error");
    }
  }

  Future<InterfaceDto> getInterfaceById(int interfaceId) async {
    var url = 'http://localhost:8081/api/interfaces/${interfaceId}';

    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(response.body);
      //List<InterfaceDto> interfaces = [];

      var interface = InterfaceDto.fromJson(jsonResponse);

      return interface;
    } else {
      return Future.error("Internal server error");
    }
  }

  Future<dynamic> createInterface(
      String projectId, String wireframeId, String interfaceName) async {
    final prefs = await SharedPreferences.getInstance();

    var userId = prefs.getInt("userId") ?? 0;
    var url =
        'http://localhost:8081/api/users/${userId}/projects/${projectId}/wireframes/${wireframeId}/interfaces';

    Uri uri = Uri.parse(url);

    var body = {'interfaceName': interfaceName};

    var response = await http.post(uri,
        body: json.encode(body),
        headers: {"Accept": "*/*", "Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
