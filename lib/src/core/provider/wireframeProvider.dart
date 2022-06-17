import 'dart:convert';
import 'dart:html';
import 'package:afterdrawing/src/constants/apisUrl.dart';
import 'package:afterdrawing/src/model/WireframeDto.dart';
import 'package:http_parser/http_parser.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class WireframeProvider {
  Future<dynamic> uploadImagetoBack() async {
    //PlatformFile file = resultImage.files.single;

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
      var request = http.MultipartRequest(
          'POST', Uri.parse('$urlBackendApi/upload/image'));
      request.files.add(
          http.MultipartFile.fromBytes('file', await file.bytes!.cast<int>(),
              //ByteStream.fromBytes(resultImage.files.first.bytes!).toList(),
              filename: file.name,
              contentType: MediaType('image', 'jpeg')));

      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(response.reasonPhrase);
        return jsonResponse['id'];
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

  downloadCode() {
    var url =
        "$urlBackendApi/get/wireframe/code/download"; /*Url.createObjectUrlFromBlob(
        Blob(["http://localhost:8081/api/get/wireframe/code/download"]));*/
    AnchorElement(href: url)
      ..setAttribute('download', '<Code1.txt>')
      ..click();
  }

  Future<bool> isUploadedImageAvailable(nameFileArgument) async {
    /*if (nameFileArgument.contains(" ")) {
      nameFileArgument.replaceAll(" ", "%20");
    }*/
    String url = '$urlBackendApi/get/wireframe/${nameFileArgument}';

    Uri uri = Uri.parse(url);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return true;
    } else {
      return Future.error("Internal Server Error");
    }
  }

  Future<List<String>> getWireframeInfo(String wireframeId) async {
    /*if (nameFileArgument.contains(" ")) {
      nameFileArgument.replaceAll(" ", "%20");
    }*/

    String url = '$urlBackendApi/get/wireframe/info/${wireframeId}';

    Uri uri = Uri.parse(url);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      dynamic jsonresponse = json.decode(response.body);

      var wireResponse = WireframeDto.fromJson(jsonresponse);

      List<String> wireframeCode = wireResponse.code;
      //print(wireframeCode);
      return wireframeCode;
    } else {
      return Future.error("Internal Server Error");
    }
  }

  Future<WireframeDto> getWireframe(String nameFileArgument) async {
    /*if (nameFileArgument.contains(" ")) {
      nameFileArgument.replaceAll(" ", "%20");
    }*/

    String url = '$urlBackendApi/get/wireframe/info/${nameFileArgument}';

    Uri uri = Uri.parse(url);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      dynamic jsonresponse = json.decode(response.body);

      var wireResponse = WireframeDto.fromJson(jsonresponse);

      List<String> wireframeCode = wireResponse.code;
      //print(wireframeCode);
      return wireResponse;
    } else {
      return Future.error("Internal Server Error");
    }
  }
}

List<int> convertFileToCast(data) {
  List<int> list = data.cast();
  return list;
}
