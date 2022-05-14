import 'package:afterdrawing/src/core/provider/wireframeProvider.dart';
import 'package:flutter/material.dart';

class GenerateInterfaces2 extends StatefulWidget {
  GenerateInterfaces2({Key? key}) : super(key: key);

  @override
  State<GenerateInterfaces2> createState() => _GenerateInterfaces2State();
}

class _GenerateInterfaces2State extends State<GenerateInterfaces2> {
  final nameImage = "Prueba%201.PNG";

  WireframeProvider wireframeProvider = WireframeProvider();

  @override
  Widget build(BuildContext context) {
    String nameFileArgument =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Generador de Interfaces',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            //Contenedor de la imagen y codigo descargable
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  //Columna del archivo descargado con un titulo
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Código generado",
                      style: TextStyle(fontSize: 20),
                    ),
                    Divider(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          wireframeProvider.downloadCode();
                        },
                        child: Text("Descargar código"))
                  ],
                ),
                FadeInImage(
                    placeholder: AssetImage("lib/src/images/wireframelogo.png"),
                    image: NetworkImage(
                        'http://localhost:8081/api/get/wireframe/${nameFileArgument}'))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
