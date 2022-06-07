import 'package:afterdrawing/src/model/WireframeDto.dart';

class InterfaceDto {
  int id = 0;
  String interfaceName = '';
  WireframeDto wireframe = WireframeDto(id: 0, name: '', classes: [], code: []);

  InterfaceDto(
      {required this.id, required this.interfaceName, required this.wireframe});

  factory InterfaceDto.fromJson(Map<String, dynamic> interfaceJson) {
    var wireframeJson = interfaceJson['wireframe'];
    WireframeDto wireframeDto = WireframeDto.fromJson(wireframeJson);

    return InterfaceDto(
        id: interfaceJson['id'],
        interfaceName: interfaceJson['interfaceName'],
        wireframe: wireframeDto);
  }
}
