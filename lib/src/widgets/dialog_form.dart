import 'package:afterdrawing/src/core/bloc/projectBloc.dart';
import 'package:afterdrawing/src/model/CreateProjectDto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogForm extends StatefulWidget {
  DialogForm({Key? key}) : super(key: key);

  @override
  State<DialogForm> createState() => _DialogFormState();
}

class _DialogFormState extends State<DialogForm> {
  var projectBloc = ProjectBloc();
  var nameTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  saveFormProject() {
    var createProjectDto = CreateProjectDto();
    createProjectDto.title = projectBloc.projectName;
    createProjectDto.description = projectBloc.projectDescription;

    projectBloc.createProject(createProjectDto).then((value) {
      if (value) {
        Navigator.of(context).pop();
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
                  stream: projectBloc.projectNameStream,
                  builder: (context, snapshot) {
                    return TextFormField(
                      //controller: nameTextController,
                      onChanged: (value) {
                        projectBloc.changeProjectName(value);
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
                        }
                      },
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: projectBloc.projectDescriptionStream,
                  builder: (context, snapshot) {
                    return TextFormField(
                        //controller: nameTextController,
                        onChanged: (value) {
                          projectBloc.changeProjectDescription(value);
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
                      //saveFormProject();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Crear'),
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.all(18)))
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
