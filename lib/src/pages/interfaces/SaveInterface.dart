import 'package:afterdrawing/src/core/bloc/interfaceBloc.dart';
import 'package:afterdrawing/src/core/bloc/projectBloc.dart';
import 'package:afterdrawing/src/core/provider/interfaceProvider.dart';
import 'package:afterdrawing/src/core/provider/projectProvider.dart';
import 'package:afterdrawing/src/model/InterfaceDto.dart';
import 'package:afterdrawing/src/model/WireframeDto.dart';
import 'package:afterdrawing/src/utils/SnackBarNotification.dart';
import 'package:afterdrawing/src/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SaveInterface extends StatefulWidget {
  const SaveInterface({Key? key}) : super(key: key);

  @override
  State<SaveInterface> createState() => _SaveInterfaceState();
}

class _SaveInterfaceState extends State<SaveInterface> {
  var interfaceBloc = InterfaceBloc();
  var projectBloc = ProjectBloc();
  var wireframeIdError = 0;
  var projectProvider = ProjectProvider();
  var interfaceNameController = TextEditingController();

  String? _currentProject;

  String wireframeIdPrueba = "";

  final _formKey = GlobalKey<FormState>();
  String idWireframeArgument = "";

  @override
  void initState() {
    setState(() {
      projectBloc.getProjects();
      //_currentProject = projectBloc.projects[0].title;
    });

    // TODO: implement initState
    super.initState();
  }

  saveFormInterface() {
    var interfaceProvider = InterfaceProvider();

    interfaceProvider
        .createInterface(
            _currentProject!, idWireframeArgument, interfaceNameController.text)
        .then((value) {
      if (value == true) {
        SnackBarNotification().showSnackbar(Utils.homeNavigator.currentContext!,
            'Interface guardada, revise en Projectos', "success");
        Utils.homeNavigator.currentState!.pushNamed("generate_interfaces1");
      } else {
        SnackBarNotification().showSnackbar(Utils.homeNavigator.currentContext!,
            "Error en el servidor, intentarlo más tarde", "error");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)!.settings.arguments;

    if (argument == null) {
      idWireframeArgument = wireframeIdPrueba;
    } else {
      idWireframeArgument =
          ModalRoute.of(context)!.settings.arguments.toString();
    }

    return Scaffold(
      appBar: AppBar(title: Text("Crear proyecto")),
      body: Container(
        height: 2000,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text("Guardar interface",style: TextStyle(fontSize: 20),),
              SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Proyecto: "),
                FutureBuilder(
                    future: projectProvider.getAllProjectsByUser(),
                    builder: (context, snapshot) {
                      var projectsData = snapshot.data as List;
                      //_currentProject = projectBloc.projects[0].title;
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done) {
                        return projectsData.length > 0
                            ? Container(
                                width: 190,
                                child: DropdownButtonFormField(
                                  value: _currentProject,
                                  hint: Text(_currentProject.toString()),
                                  validator: (projectName) {
                                    if (projectName == null &&
                                        _currentProject!.isEmpty) {
                                      return "Seleccione un proyecto";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _currentProject = newValue;
                                      print(_currentProject);
                                    });
                                  },
                                  items: projectsData.map((item) {
                                    return DropdownMenuItem(
                                      child: Text(item.title),
                                      value: item.id.toString(),
                                    );
                                  }).toList(),
                                ),
                              )
                            : Text("No posee proyectos");
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Text("Error en el servidor");
                      }
                    })
              ]),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    child: TextFormField(
                      controller: interfaceNameController,
                      onChanged: ((value) {
                        interfaceBloc.changeInterfaceName(value);
                        //print(interfaceBloc.interfaceName);
                      }),
                      decoration: InputDecoration(
                          /*errorText: snapshot.hasError
                                    ? snapshot.error.toString()
                                    : null,*/
                          labelText: 'Nombre de interface'),
                      textInputAction: TextInputAction.next,
                      validator: (interfaceNameValid) {
                        if (interfaceNameValid!.isEmpty) {
                          return 'Este campo no puede estar vacio';
                        } else {
                          return null;
                        }
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Form complete");
                      saveFormInterface();
                    }
                  },
                  child: Text("Guardar"))
            ],
          ),
        ),
      ),
    );
  }
}
