import 'package:afterdrawing/src/core/bloc/interfaceBloc.dart';
import 'package:afterdrawing/src/model/ProjectDto.dart';
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

  var interfaceBloc = InterfaceBloc();

  @override
  Widget build(BuildContext context) {
    ProjectDto argumentProject;

    argumentProject = ModalRoute.of(context)!.settings.arguments as ProjectDto;

    interfaceBloc.getInterfaces(argumentProject.id);

    return Scaffold(
      appBar: AppBar(title: Text('Editar ${argumentProject.title}')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(argumentProject.description),
            SizedBox(
              height: 30,
            ),
            Text(
              'Interfaces',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
                'Selecciona en el tacho de basura las interfaces que quiera eliminar'),
            SizedBox(
              height: 15,
            ),
            StreamBuilder(
                stream: interfaceBloc.interfacesStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var interfacesData = snapshot.data as List;
                    return Scrollbar(
                      controller: _scrollController,
                      child: Container(
                        height: 400,
                        child: interfacesData.length > 0
                            ? ListView.builder(
                                controller: _scrollController,
                                scrollDirection: Axis.horizontal,
                                itemCount: interfacesData.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    /*onTap: () {
                                      print("Tap");
                                      Utils.homeNavigator.currentState!
                                          .pushNamed('wireframeview',
                                              arguments: [
                                            argumentProject.title,
                                            interfacesData[index]
                                          ]);
                                    },*/
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: FadeInImage(
                                              width: 300,
                                              //height: 100,
                                              placeholder: AssetImage(
                                                  "lib/src/images/wireframelogo.png"),
                                              image: NetworkImage(
                                                  'http://localhost:8081/api/get/wireframe/${interfacesData[index].wireframe.id}'),
                                              imageErrorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  "lib/src/images/wireframelogo.png",
                                                  width: 300,
                                                );
                                              }),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                                Icons.delete_outline_outlined))
                                      ],
                                    ),
                                  );
                                })
                            : FadeInImage(
                                width: 300,
                                //height: 100,
                                placeholder: AssetImage(
                                    "lib/src/images/wireframelogo.png"),
                                image: NetworkImage(
                                    'http://localhost:8081/api/get/wireframe/$nameFile'),
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                    "lib/src/images/wireframelogo.png",
                                    width: 300,
                                  );
                                }),
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Container(
                      height: 400,
                      child: Center(
                          //height: 100,
                          //width: 100,
                          child: CircularProgressIndicator()),
                    );
                  } else {
                    return Text("Error en el servidor");
                  }
                }),
            SizedBox(
              height: 30,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(padding: EdgeInsets.all(18)),
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
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(18))),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Cancelar",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      )),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
