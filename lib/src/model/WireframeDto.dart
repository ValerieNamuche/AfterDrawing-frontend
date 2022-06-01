class WireframeDto {
  int id = 0;

  String name = '';

  List<String> classes = [];

  List<String> code = [];

  WireframeDto({
    required this.id,
    required this.name,
    required this.classes,
    required this.code,
  });

  factory WireframeDto.fromJson(Map<String, dynamic> wireJson) {
    var classesFromJson = wireJson['classes'];
    List<String> classesList = classesFromJson.cast<String>();

    var codeFromJson = wireJson['code'];
    List<String> codeList = codeFromJson.cast<String>();

    /*var x1FromJson = wireJson['x1'];
    List<int> x1List = x1FromJson.cast<int>();
    var y1FromJson = wireJson['y1'];
    List<int> y1List = y1FromJson.cast<int>();

    var x2FromJson = wireJson['x2'];
    List<int> x2List = x2FromJson.cast<int>();
    var y2FromJson = wireJson['y2'];
    List<int> y2List = y2FromJson.cast<int>();*/

    return WireframeDto(
      id: wireJson['id'],
      name: wireJson['name'],
      classes: classesList,
      code: codeList,
    );
  }
}
