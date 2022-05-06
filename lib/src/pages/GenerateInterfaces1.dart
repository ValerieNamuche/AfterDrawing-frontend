import 'package:flutter/material.dart';
import 'dart:html';

// pagina donde agrego las interfaces
class GenerateInterfaces1 extends StatefulWidget {
  @override
  _GenerateInterfacesState1 createState() => _GenerateInterfacesState1();
}

class _GenerateInterfacesState1 extends State<GenerateInterfaces1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Interfaces'),
      ),
      // imagen de fondo usando una imagen de lib/src/images/fondologin.jpg
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // la tarjeta que contiene todo el contenido en toda la pantalla
        child: Container(
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
                    RaisedButton(
                      onPressed: () => {uploadImage()},
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
                      color: const Color.fromARGB(255, 43, 134, 209),
                      // circular shape
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(
                      width: 100.0,
                    ),
                    RaisedButton(
                      onPressed: () => {},
                      // diseño del boton
                      child: const Text(
                        'Continuar',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,

                          // cursiva
                        ),
                      ),

                      // color del boton
                      color: const Color.fromARGB(255, 43, 134, 209),
                      // circular shape
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
      print('Done');
    });
  });
}
