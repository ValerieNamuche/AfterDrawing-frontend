import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:afterdrawing/src/model/InterfaceDto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InterfaceProvider {
  Future<List<InterfaceDto>> getAllInterfacesByProjectId(int projectId) async {
    var url = 'https://afterdrawingapp.herokuapp.com/api/projects/${projectId}/interfaces';

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
    var url = 'https://afterdrawingapp.herokuapp.com/api/interfaces/${interfaceId}';

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
        'https://afterdrawingapp.herokuapp.com/api/users/${userId}/projects/${projectId}/wireframes/${wireframeId}/interfaces';

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

/////PENDIENTE POR ENDPOINT
  Future<dynamic> updateInterface(interfaceId) async {
    var url = 'https://afterdrawingapp.herokuapp.com/api/interfaces/$interfaceId';

    Uri uri = Uri.parse(url);

    FilePickerResult? resultImage = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
      ],
    );

    if (resultImage != null) {
      PlatformFile file = resultImage.files.first;

      //
      var done = resultImage.files.first.name;
      print(done);
      //
      var request = http.MultipartRequest('PUT', uri);

      request.files.add(http.MultipartFile.fromBytes(
          'file', await file.bytes!.cast<int>(),
          filename: file.name, contentType: MediaType('image', 'jpeg')));

      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var newInterface = InterfaceDto.fromJson(jsonResponse);

        return newInterface;
      } else {
        print(response.statusCode);
        print(response.reasonPhrase);
        return "Internal Server Error (customed)";

        // Causaba error cuando se escogia una imagen, aun cuando se subia correctamente
        //return Future.error("Internal Server Error");
      }
    } else {
      return false;
    }
  }

///////////////////

  Future<bool> deleteInterface(int wireframeId) async {
    final prefs = await SharedPreferences.getInstance();

    var userId = prefs.getInt("userId") ?? 0;
    var url = 'https://afterdrawingapp.herokuapp.com/api/interfaces/${wireframeId}';

    Uri uri = Uri.parse(url);

    var response = await http.delete(uri);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
