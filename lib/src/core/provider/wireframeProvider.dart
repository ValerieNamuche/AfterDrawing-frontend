import 'dart:html';
import 'package:http_parser/http_parser.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class WireframeProvider {
  Future<dynamic> uploadImagetoBack() async {
    var resultImage = await FilePicker.platform.pickFiles();

    if (resultImage != null) {
      PlatformFile file = resultImage.files.single;
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://localhost:8081/api/upload/image'));
      request.files.add(http.MultipartFile.fromBytes(
        'file', await resultImage.files.first.bytes!.cast<int>(),
        //ByteStream.fromBytes(resultImage.files.first.bytes!).toList(),
        filename: resultImage.files.first.name,
        //contentType: MediaType('*','*')
      ));

      var response = await request.send();

      if (response.statusCode == 200) {
        print(response.reasonPhrase);
        return resultImage.files.first.name;
      } else {
        print(response.statusCode);
        print(response.reasonPhrase);
        return Future.error("Internal Server Error");
      }
    } else {
      return false;
    }
  }

  downloadCode() {
    var url =
        "http://localhost:8081/api/get/wireframe/code/download"; /*Url.createObjectUrlFromBlob(
        Blob(["http://localhost:8081/api/get/wireframe/code/download"]));*/
    AnchorElement(href: url)
      ..setAttribute('download', '<Code1.txt>')
      ..click();
  }
}

List<int> convertFileToCast(data) {
  List<int> list = data.cast();
  return list;
}
