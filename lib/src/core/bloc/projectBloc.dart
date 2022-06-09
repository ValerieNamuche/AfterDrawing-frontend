import 'package:afterdrawing/src/core/bloc/validators.dart';
import 'package:afterdrawing/src/core/provider/projectProvider.dart';
import 'package:afterdrawing/src/model/CreateProjectDto.dart';
import 'package:afterdrawing/src/model/ProjectDto.dart';
import 'package:rxdart/rxdart.dart';

class ProjectBloc with Validators {
  ProjectProvider projectProvider = ProjectProvider();

  BehaviorSubject<List<ProjectDto>> _projectsController =
      BehaviorSubject<List<ProjectDto>>();
  Stream<List<ProjectDto>> get projectsStream => _projectsController.stream;
  Function(List<ProjectDto>) get changeProjects => _projectsController.sink.add;
  List<ProjectDto> get projects => _projectsController.value;

  ///// Campos para formulario
  ///Nombre proyecto
  final _projectNameController = BehaviorSubject<String>();
  Stream<String> get projectNameStream =>
      _projectNameController.stream.transform(validateName);
  Function(String) get changeProjectName => _projectNameController.sink.add;
  String get projectName => _projectNameController.value;

  ///////Description proyecto
  final _projectDescriptionController = BehaviorSubject<String>();
  Stream<String> get projectDescriptionStream =>
      _projectDescriptionController.stream.transform(validateName);
  Function(String) get changeProjectDescription =>
      _projectDescriptionController.sink.add;
  String get projectDescription => _projectDescriptionController.value;

  void getProjects() async {
    var response = await projectProvider.getAllProjectsByUser();
    changeProjects(response);
  }

  Future<bool> createProject(CreateProjectDto createProjectDto) async {
    var response = await projectProvider.createProject(createProjectDto);
    if (response == true) {
      getProjects();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProject(projectId) async {
    var response = await projectProvider.deleteProject(projectId);
    if (response == true) {
      getProjects();
      return true;
    } else {
      return false;
    }
  }

  dispose() {
    _projectNameController.close();
    _projectDescriptionController.close();
  }
}
