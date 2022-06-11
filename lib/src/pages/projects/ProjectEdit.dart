import 'package:afterdrawing/src/core/bloc/interfaceBloc.dart';
import 'package:afterdrawing/src/core/bloc/projectBloc.dart';
import 'package:afterdrawing/src/model/CreateProjectDto.dart';
import 'package:afterdrawing/src/model/ProjectDto.dart';
import 'package:afterdrawing/src/utils/SnackBarNotification.dart';
import 'package:afterdrawing/src/utils/Utils.dart';
import 'package:flutter/material.dart';

class ProjectEdit extends StatefulWidget {
  ProjectEdit({Key? key}) : super(key: key);

  @override
  State<ProjectEdit> createState() => _ProjectEditState();
}

class _ProjectEditState extends State<ProjectEdit> {
  var nameFile = "";
  ScrollController _scrollController = ScrollController();
  ProjectDto argumentProject =
      ProjectDto(id: 0, title: 'title', description: 'description');
  var interfaceBloc = InterfaceBloc();
  var projectBloc = ProjectBloc();
  var _formKey = GlobalKey<FormState>();

  saveEditProjectForm() {
    var createProjectDto = CreateProjectDto();
    createProjectDto.title = projectBloc.projectName;
    createProjectDto.description = projectBloc.projectDescription;

    projectBloc
        .updateProject(createProjectDto, argumentProject.id)
        .then((value) {
      if (value) {
        SnackBarNotification().showSnackbar(Utils.homeNavigator.currentContext!,
            "Se modificó el proyecto", "success");
        Utils.homeNavigator.currentState!.pushNamedAndRemoveUntil(
            "project", ModalRoute.withName("generate_interfaces1"));
      } else {
        SnackBarNotification().showSnackbar(Utils.homeNavigator.currentContext!,
            "Se creó el nuevo proyecto", "error");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    argumentProject = ModalRoute.of(context)!.settings.arguments as ProjectDto;

    interfaceBloc.getInterfaces(argumentProject.id);

    return Scaffold(
      appBar: AppBar(title: Text('Editar ${argumentProject.title}')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          Form(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Form(
                key: _formKey,
                child: Column(children: [
                  StreamBuilder(
                      stream: projectBloc.projectNameStream,
                      builder: (context, snapshot) {
                        return TextFormField(
                            initialValue: argumentProject.title,
                            onChanged: (value) {
                              projectBloc.changeProjectName(value);
                            },
                            decoration: InputDecoration(
                                labelText:
                                    "Ingrese un nuevo nombre para su proyecto",
                                errorText: snapshot.hasError
                                    ? snapshot.error.toString()
                                    : null),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Rellene este campo para continuar"; //validacion en caso no se ingrese nada desde el principio
                              }
                            });
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  StreamBuilder(
                      stream: projectBloc.projectDescriptionStream,
                      builder: (context, snapshot) {
                        return TextFormField(
                            initialValue: argumentProject.title,
                            onChanged: (value) {
                              projectBloc.changeProjectDescription(value);
                            },
                            decoration: InputDecoration(
                                labelText:
                                    "Ingrese una nueva description para su proyecto",
                                errorText: snapshot.hasError
                                    ? snapshot.error.toString()
                                    : null),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Rellene este campo para continuar"; //validacion en caso no se ingrese nada desde el principio
                              }
                            });
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              saveEditProjectForm();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(18)),
                          child: Text(
                            "Terminar de editar",
                            style: TextStyle(fontSize: 16),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.grey[300]),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(18))),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Cancelar",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            )),
                      )
                    ],
                  )
                ]),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
