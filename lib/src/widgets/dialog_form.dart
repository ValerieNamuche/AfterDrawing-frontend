import 'package:afterdrawing/src/core/bloc/projectBloc.dart';
import 'package:afterdrawing/src/model/CreateProjectDto.dart';
import 'package:afterdrawing/src/utils/SnackBarNotification.dart';
import 'package:afterdrawing/src/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogCreateProject extends StatefulWidget {
  final ProjectBloc? projectBloc;
  DialogCreateProject({Key? key, this.projectBloc}) : super(key: key);

  @override
  State<DialogCreateProject> createState() => DialogCreateProjectState();
}

class DialogCreateProjectState extends State<DialogCreateProject> {
  //var projectBloc = ProjectBloc();
  var nameTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  saveFormProject() {
    var createProjectDto = CreateProjectDto();
    createProjectDto.title = widget.projectBloc!.projectName;
    createProjectDto.description = widget.projectBloc!.projectDescription;
    Navigator.of(context, rootNavigator: true).pop();
    widget.projectBloc!.createProject(createProjectDto).then((value) {
      if (value) {
        //Navigator.pop(context);

        SnackBarNotification().showSnackbar(Utils.homeNavigator.currentContext!,
            "Se creó el nuevo proyecto", "success");
        //print("Proyecto eliminado");
        //Utils.homeNavigator.currentState!.popAndPushNamed("project");
      } else {
        SnackBarNotification().showSnackbar(Utils.homeNavigator.currentContext!,
            "Error en el server al crear el proyecto", "error");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Crear Projecto',
        textAlign: TextAlign.center,
      ),
      content: Container(
        width: 450,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StreamBuilder(
                  stream: widget.projectBloc!.projectNameStream,
                  builder: (context, snapshot) {
                    return TextFormField(
                      //controller: nameTextController,
                      onChanged: (value) {
                        widget.projectBloc!.changeProjectName(value);
                      },
                      decoration: InputDecoration(
                          labelText:
                              "Ingrese un nombre para su Projecto", //validacion en caso ya se haya ingresado texto
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Rellene este campo para continuar"; //validacion en caso no se ingrese nada desde el principio
                        } else if (value.length > 25) {
                          return "Escoja un nombre más pequeño";
                        }
                      },
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: widget.projectBloc!.projectDescriptionStream,
                  builder: (context, snapshot) {
                    return TextFormField(
                        //controller: nameTextController,
                        onChanged: (value) {
                          widget.projectBloc!.changeProjectDescription(value);
                        },
                        decoration: InputDecoration(
                            labelText:
                                "Ingrese una descripcion para su Projecto",
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Rellene este campo para continuar"; //validacion en caso no se ingrese nada desde el principio
                          } else if (value.length > 75) {
                            return "Escoja un nombre más pequeño";
                          }
                        });
                  }),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //si el form es valido

                    print("Hola, form completo");
                    saveFormProject();
                    //Navigator.of(context).pop();
                  }
                },
                child: Text('Crear'),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 32, 68, 252),
                    padding: EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80))),
              )
            ],
          ),
        ),
      ),
      /*actions: [
        ElevatedButton(
            onPressed: () {},
            child: Text('Crear'),
            style: ElevatedButton.styleFrom(padding: EdgeInsets.all(18)))
      ],*/
    );
  }
}
