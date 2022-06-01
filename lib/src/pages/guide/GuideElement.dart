// ignore_for_file: deprecated_member_use

import 'package:afterdrawing/src/pages/guide/elementsdialog/button_dialog.dart';
import 'package:afterdrawing/src/pages/guide/elementsdialog/icon_dialog.dart';
import 'package:flutter/material.dart';

//Create a GridView of 6 elements
class GuideElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    int val = -1;
    return Scaffold(
        /*appBar: AppBar(
          title: const Text('Guía de elementos Reconocidos'),
        ),*/
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Guía de elementos Reconocidos',
            style: TextStyle(fontSize: 25),
          ),
        ),
        Flexible(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: <Widget>[
              // insert the elements here we have a widget for each element like buttons, text, images etc. like an interface

              //Checkbox and  RadioButton elements in Flutter
              CheckBoxAndRadioButtonResponsive(val, context),
              //Button in container
              ButtonContainer(screenHeight, context),
              // search bar using the search bar widget (ganador)
              SearchBarContainer(),

              IconContainer(context),
              // Container with a image cuadro_de_texto.png
              TextContainerWithImage(),
              // Container with a image cuadro_de_texto.png
              ImageContainer(),
            ],
          ),
        ),
      ],
    ));
  }

  Container ImageContainer() {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        // Color que combina el fondo con el texto
        color: Colors.blueGrey[100],

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 40,
            ),
            Expanded(
              child: SizedBox(
                //image with size
                child: Image.asset(
                  'lib/src/images/image_element_guide.jpg',
                  width: 80,
                  fit: BoxFit.fill,

                  // color del boton y tamano del icono
                ),
              ),
            ),

            // espacio
            const SizedBox(
              width: 40,
            ),
            const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('Image'),
                const SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () => {},
                  // diseño del boton
                  child: const Text('Ver Ejemplos'),

                  // color del boton
                  color: const Color.fromARGB(255, 43, 134, 209),
                  // circular shape
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }

  Container TextContainerWithImage() {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        // Color que combina el fondo con el texto
        color: Colors.blueGrey[100],

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 40,
            ),
            Expanded(
              child: SizedBox(
                //image with size
                child: Image.asset(
                  'lib/src/images/cuadro_de_texto.png',
                  //width: 100,
                  fit: BoxFit.fill,

                  // color del boton y tamano del icono
                ),
              ),
            ),

            // espacio
            const SizedBox(
              width: 40,
            ),
            const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('Text'),
                const SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () => {},
                  // diseño del boton
                  child: const Text('Ver Ejemplos'),

                  // color del boton
                  color: const Color.fromARGB(255, 43, 134, 209),
                  // circular shape
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }

  Container IconContainer(context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        // Color que combina el fondo con el texto
        color: Colors.blueGrey[100],

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () => {},
              // color del boton y tamano del icono
              color: const Color.fromARGB(255, 43, 134, 209),
              iconSize: 40,
            ),

            // espacio
            const SizedBox(
              width: 40,
            ),
            const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('Icon'),
                const SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () => {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return IconDialog();
                        })
                  },
                  // diseño del boton
                  child: const Text('Ver Ejemplos'),

                  // color del boton
                  color: const Color.fromARGB(255, 43, 134, 209),
                  // circular shape
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container SearchBarContainer() {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        // Color que combina el fondo con el texto
        color: Colors.blueGrey[100],

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelText: 'Label',
                    ),
                  ),

                  const Divider(
                    height: 25,
                    color: Colors.transparent,
                  ),
                  // other label
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Input Text',
                    ),
                  ),
                ],
              ),
            ),

            // espacio
            const SizedBox(
              width: 40,
            ),
            //const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('Input Text'),
                const SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () => {},
                  // diseño del boton
                  child: const Text('Ver Ejemplos'),

                  // color del boton
                  color: const Color.fromARGB(255, 43, 134, 209),
                  // circular shape
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget ButtonContainer(double screenWeight, context) {
    var containerWidth = screenWeight * 0.1;
    if (screenWeight < 680) {
      containerWidth = 68;
    } else if (screenWeight > 1800) {
      containerWidth = 250;
    } else {
      containerWidth = screenWeight * 0.1;
    }
    return Container(
      //width: 10,
      padding: const EdgeInsets.all(10.0),
      //elements in the center of the container
      // the container ajusts the size of the elements
      alignment: Alignment.center,
      child: Card(
        color: Colors.blueGrey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: RaisedButton(
                onPressed: () => {},
                child: const Text("Button"),
              ),
            ),
            // espacio entre los elementos
            const SizedBox(
              width: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: containerWidth,
                  child: FittedBox(
                      child: Text(
                          'Button Text' /*, style: TextStyle(fontSize: 15)*/)),
                ),
                const SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () => {
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return ButtonDialog();
                        })
                  },
                  // diseño del boton
                  child: const Text('Ver Ejemplos'),

                  // color del boton
                  color: const Color.fromARGB(255, 43, 134, 209),
                  // circular shape
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  LayoutBuilder CheckBoxAndRadioButtonResponsive(int val, context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return CheckBoxAndRadioButtonHorizontal(val);
      } else {
        return CheckBoxAndRadioButtonVertical(val);
      }
    });
  }

  Container CheckBoxAndRadioButtonHorizontal(int val) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10.0),
      //elements in the center of the container
      // the container ajusts the size of the elements
      alignment: Alignment.center,
      child: Card(
        color: Colors.blueGrey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    const Text(
                      'Option',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                      value: 1,
                      onChanged: (value) {},
                      groupValue: val,
                    ),
                    const Text(
                      'Option',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Container(
                      child: const Text(
                        'Option',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                      //RadioButton is marked with true
                      value: val,
                      onChanged: (value) {},
                      groupValue: 2,
                    ),
                    const Text(
                      'Option',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('Checked View'),
                const SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () => {},
                  // diseño del boton
                  child: const Text('Ver Ejemplos'),

                  // color del boton
                  color: const Color.fromARGB(255, 43, 134, 209),
                  // circular shape
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container CheckBoxAndRadioButtonVertical(int val) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10.0),
      //elements in the center of the container
      // the container ajusts the size of the elements
      alignment: Alignment.center,
      child: Card(
        color: Colors.blueGrey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('Checked View'),
                const SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () => {},
                  // diseño del boton
                  child: const Text('Ver Ejemplos'),

                  // color del boton
                  color: const Color.fromARGB(255, 43, 134, 209),
                  // circular shape
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                        ),
                        const Text(
                          'Option',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          value: -1,
                          onChanged: (value) {},
                          groupValue: val,
                        ),
                        const Text(
                          'Option',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        Container(
                          child: const Text(
                            'Option',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          //RadioButton is marked with true
                          value: val,
                          onChanged: (value) {},
                          groupValue: 2,
                        ),
                        const Text(
                          'Option',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

  


// Create a Enum from widgets like buttons, searchbars, scrollbar,etc
