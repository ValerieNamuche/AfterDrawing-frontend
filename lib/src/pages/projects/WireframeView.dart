import 'package:afterdrawing/src/constants/textoPrueba.dart';
import 'package:afterdrawing/src/core/bloc/interfaceBloc.dart';
import 'package:afterdrawing/src/model/InterfaceDto.dart';
import 'package:afterdrawing/src/model/WireframeDto.dart';
import 'package:afterdrawing/src/pages/projects/Project.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WireframeView extends StatefulWidget {
  WireframeView({
    Key? key,
  }) : super(key: key);

  @override
  State<WireframeView> createState() => _WireframeViewState();
}

class _WireframeViewState extends State<WireframeView> {
  ScrollController _scrollController =
      ScrollController(/*initialScrollOffset: 50.0*/);
  var isCopied = false;
  String nameProjectArgument = "";
  var InterfaceArgument = InterfaceDto(
      id: 0,
      interfaceName: "",
      wireframe: new WireframeDto(id: 0, name: "", classes: [], code: []));
  String nameWireframeArgument = "My interface";
  String wireframeContent = textoPrueba;

  var interfaceBloc = InterfaceBloc();

  String convertListToString(List<String> listStrings) {
    var concatenate = StringBuffer();

    listStrings.forEach((element) {
      concatenate.writeln(element);
    });

    return concatenate.toString();
  }

  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)!.settings.arguments as List;

    if (argument != null) {
      nameProjectArgument = argument[0];
      InterfaceArgument = argument[1] as InterfaceDto;
    }

    interfaceBloc.getSingleInterface(InterfaceArgument.id);
    return Scaffold(
        appBar: AppBar(
          title: Text(
              nameProjectArgument + ' - ' + InterfaceArgument.interfaceName),
        ),
        body: Container(
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Código generado",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Flexible(
                  child: StreamBuilder(
                      stream: interfaceBloc.singleInterfaceStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var interfaceData = snapshot.data as InterfaceDto;
                          var textCode =
                              convertListToString(interfaceData.wireframe.code);

                          return CodeView(textCode);
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            width: 400,
                            height: 550,
                            child: Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          );
                        } else {
                          return CodeView(textoPrueba);
                        }
                      }),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FadeInImage(
                          height: 500,
                          placeholder:
                              AssetImage("lib/src/images/wireframelogo.png"),
                          image: NetworkImage(
                              'http://localhost:8081/api/get/wireframe/${InterfaceArgument.wireframe.id}'),
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "lib/src/images/wireframelogo.png",
                              //width: 600,
                            );
                          }),
                      //Leyenda(),
                    ],
                  ),
                ),
              ],
            )
          ]),
        ));
  }

  Widget CodeView(String contentCode) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: 400,
      height: 550,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Scrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: SelectableText(
              contentCode,
              scrollPhysics: ClampingScrollPhysics(),
              toolbarOptions: ToolbarOptions(copy: true),
              onTap: () {
                Clipboard.setData(ClipboardData(text: contentCode));
                if (isCopied == false) {
                  setState(() {
                    isCopied = true;
                  });
                  print(isCopied.toString());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
