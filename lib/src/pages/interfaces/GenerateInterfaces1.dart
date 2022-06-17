import 'package:afterdrawing/src/core/provider/wireframeProvider.dart';
import 'package:afterdrawing/src/pages/guide/GuideElement.dart';
import 'package:afterdrawing/src/utils/Utils.dart';
import 'package:afterdrawing/src/widgets/custom_nav_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:html';

//import 'Home.dart';

// pagina donde agrego las interfaces
class GenerateInterfaces1 extends StatefulWidget {
  @override
  _GenerateInterfacesState1 createState() => _GenerateInterfacesState1();
}

class _GenerateInterfacesState1 extends State<GenerateInterfaces1>
    with SingleTickerProviderStateMixin {
  late double screenHeight;
  late double screenWidth;
  late double topPadding;
  late double bottomPadding;
  late double sidePadding;

  WireframeProvider wireframeProvider = WireframeProvider();
  int nameImage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.03;
    sidePadding = screenWidth * 0.05;

    print('Width: $screenWidth');
    print('Height: $screenHeight');

    return Scaffold(
      /*appBar: AppBar(
        //leading:Text("Icono"),
        //title: CustomNavBar(),
        title: const Text('Crear Interfaces'),
      ),*/
      // imagen de fondo usando una imagen de lib/src/images/fondologin.jpg
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          // la tarjeta que contiene todo el contenido en toda la pantalla
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Crear Interfaces',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            // el contenedor que contiene todo el contenido de la tarjeta
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              // el contenedor que contiene todo el contenido de la tarjeta
              children: <Widget>[
                // el titulo de la tarjeta
                Image.asset(
                  'lib/src/images/wireframesmain.jpg',
                  width: 900,
                  height: 500,
                ),
                // el contenido de la tarjeta

                // el boton para ir a la pagina de crear interfaces
                Container(
                  alignment: Alignment.center,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          uploadImageWithFilePicker();
                          //var resultImage = FilePicker.platform.pickFiles();
                        },
                        // diseño del boton
                        child: const Text(
                          'Subir Wireframe',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,

                            // cursiva
                          ),
                        ),

                        // color del boton
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 32, 68, 252),
                            padding: EdgeInsets.all(18),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80))),
                      ),
                      const SizedBox(
                        width: 100.0,
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          Utils.homeNavigator.currentState!.pushNamed("guide")
                        },
                        // diseño del boton
                        child: const Text(
                          'Guía de elementos',
                          style: TextStyle(
                            fontSize: 18,
                            //color: Colors.white,

                            // cursiva
                          ),
                        ),

                        // color del boton
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 32, 68, 252),
                            padding: EdgeInsets.all(18),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  void uploadImageWithFilePicker() async {
    /*FilePickerResult? resultImage = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
      ],
    );

    if (resultImage != null) {
      //Si se escoge una imagen
      PlatformFile file = resultImage.files.first;

      var done = resultImage.files.first.name;
      print(done);

      wireframeProvider.uploadImagetoBack(file).then((value) async {
        if (value == "Internal Server Error (customed)") {
          print("Un error ha ocurrido");
          Utils.homeNavigator.currentState!
              .pushNamed("generate_interfaces2", arguments: nameImage);
        } else {
          nameImage = value;
          print(value);
          Utils.homeNavigator.currentState!
              .pushNamed("generate_interfaces2", arguments: value);
        }
      });
    } else {
      //Si no se escoge imagen
      print("No se escogio ninguna imagen");
    }*/

////////////////////////////
    wireframeProvider.uploadImagetoBack().then((value) async {
      if (value == false) {
        // Cuando cancela la seleccion de imagen(ignorar)

      } else if (value == "Internal Server Error (customed)") {
        print(value);
        print(nameImage);
        Utils.homeNavigator.currentState!
            .pushNamed("generate_interfaces2", arguments: nameImage);
      } else {
        // si todo va bien
        nameImage = value;
        print(nameImage);
        Utils.homeNavigator.currentState!
            .pushNamed("generate_interfaces2", arguments: nameImage);
      }
    });
  }
}

void uploadImage() {
  InputElement uploadInput = FileUploadInputElement() as InputElement
    ..accept = 'image/*';
  uploadInput.click();

  uploadInput.onChange.listen((event) {
    final file = uploadInput.files!.first;
    final reader = FileReader();
    reader.readAsDataUrl(file);
    reader.onLoadEnd.listen((event) {
      print(file.name);
      print('Done');
    });
  });
}
