import 'package:afterdrawing/src/core/bloc/validators.dart';
import 'package:afterdrawing/src/core/provider/interfaceProvider.dart';
import 'package:afterdrawing/src/core/provider/wireframeProvider.dart';
import 'package:afterdrawing/src/model/InterfaceDto.dart';
import 'package:rxdart/rxdart.dart';

class InterfaceBloc with Validators {
  InterfaceProvider interfaceProvider = InterfaceProvider();
  var wireframeprovider = WireframeProvider();

  BehaviorSubject<List<InterfaceDto>> _interfacesController =
      BehaviorSubject<List<InterfaceDto>>();
  Stream<List<InterfaceDto>> get interfacesStream =>
      _interfacesController.stream;
  Function(List<InterfaceDto>) get changeInterfaces =>
      _interfacesController.sink.add;
  List<InterfaceDto> get interfaces => _interfacesController.value;

  ///// Campos para formulario
  final _interfaceNameController = BehaviorSubject<String>();
  Stream<String> get interfaceNameStream =>
      _interfaceNameController.stream.transform(validateName);
  Function(String) get changeInterfaceName => _interfaceNameController.sink.add;
  String get interfaceName => _interfaceNameController.value;

  ///////
  ///SingleInterface Stream
  final _singleInterfaceController = BehaviorSubject<InterfaceDto>();
  Stream<InterfaceDto> get singleInterfaceStream =>
      _singleInterfaceController.stream;
  Function(InterfaceDto) get changeSingleInterface =>
      _singleInterfaceController.sink.add;
  InterfaceDto get singleInterface => _singleInterfaceController.value;

  ///

  void getInterfaces(projectId) async {
    var response =
        await interfaceProvider.getAllInterfacesByProjectId(projectId);
    changeInterfaces(response);
  }

  void getSingleInterface(interfaceId) async {
    var response = await interfaceProvider.getInterfaceById(interfaceId);
    changeSingleInterface(response);
  }

  Future<bool> createInterface(projectId, wireframeId, interfName) async {
    var response = await interfaceProvider.createInterface(
        projectId, wireframeId, interfName);
    return response;
  }

  dispose() {
    _interfaceNameController.close();
  }
}
