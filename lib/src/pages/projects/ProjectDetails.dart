import 'package:afterdrawing/src/core/bloc/interfaceBloc.dart';
import 'package:afterdrawing/src/core/bloc/projectBloc.dart';
import 'package:afterdrawing/src/model/ProjectDto.dart';
import 'package:afterdrawing/src/utils/Utils.dart';
import 'package:flutter/material.dart';

import 'Project.dart';

class ProjectDetails extends StatefulWidget {
  //final Project project;
  const ProjectDetails({Key? key}) : super(key: key);

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  var nameFile = "";
  ScrollController _scrollController = ScrollController();

  var interfaceBloc = InterfaceBloc();

  @override
  void initState() {
    //interfaceBloc.getInterfaces(projectId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var argument = ModalRoute.of(context)!.settings.arguments;

    ProjectDto argumentProject;

    argumentProject = ModalRoute.of(context)!.settings.arguments as ProjectDto;

    interfaceBloc.getInterfaces(argumentProject.id);
    ////////
    return Scaffold(
      appBar: AppBar(title: Text(argumentProject.title), actions: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: IconButton(
            onPressed: () {
              Utils.homeNavigator.currentState!
                  .pushNamed('project_edit', arguments: argumentProject);
            },
            icon: Icon(Icons.edit),
            //padding: EdgeInsets.only(right: 50),
          ),
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(argumentProject.description),
          SizedBox(
            height: 30,
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
                                return InkWell(
                                  onTap: () {
                                    print("Tap");
                                    Utils.homeNavigator.currentState!
                                        .pushNamed('wireframeview', arguments: [
                                      argumentProject.title,
                                      interfacesData[index]
                                    ]);
                                  },
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
                                );
                              })
                          : FadeInImage(
                              width: 300,
                              //height: 100,
                              placeholder: AssetImage(
                                  "lib/src/images/wireframelogo.png"),
                              image: NetworkImage(
                                  'http://localhost:8081/api/get/wireframe/${nameFile}'),
                              imageErrorBuilder: (context, error, stackTrace) {
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
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(18)),
              child: Text(
                "Generar interface",
                style: TextStyle(fontSize: 16),
              ))
        ]),
      ),
    );
  }
}
