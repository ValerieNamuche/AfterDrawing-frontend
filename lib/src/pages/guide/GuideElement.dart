// ignore_for_file: deprecated_member_use

import 'package:afterdrawing/src/pages/guide/elementsdialog/button_dialog.dart';
import 'package:afterdrawing/src/pages/guide/elementsdialog/icon_dialog.dart';
import 'package:afterdrawing/src/pages/guide/elementsdialog/inputText_dialog.dart';
import 'package:afterdrawing/src/pages/guide/elementsdialog/text_Dialog.dart';
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
            style: TextStyle(fontSize: 30),
          ),
        ),
        Flexible(
          child: GridView.count(
            //shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 3 / 1.8,
            children: <Widget>[
              // insert the elements here we have a widget for each element like buttons, text, images etc. like an interface

              //Checkbox and  RadioButton elements in Flutter
              CheckBoxAndRadioButtonResponsive(val, context),
              //Button in container
              ButtonContainer(screenWidth, context),
              // search bar using the search bar widget (ganador)
              SearchBarContainer(screenWidth, context),

              IconContainer(screenWidth, context),
              // Container with a image cuadro_de_texto.png
              TextContainerWithImage(screenWidth, context),
              // Container with a image cuadro_de_texto.png
              ImageContainer(screenWidth),
            ],
          ),
        ),
      ],
    ));
  }

  Container ImageContainer(double screenWidth) {
    var iconSizeWidth = screenWidth * 0.16;
    double textWidth = 25;
    if (screenWidth < 860) {
      textWidth = 17;
    }

    return Container(
      width: 100,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        // Color que combina el fondo con el texto
        color: Colors.blueGrey[100],

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*const SizedBox(
              width: 40,
            ),*/
            Icon(
              Icons.image_outlined,
              size: iconSizeWidth,
              color: Colors.cyan,
              //fit: BoxFit.fill,

              // color del boton y tamano del icono
            ),

            // espacio
            /*const SizedBox(
              width: 40,
            ),*/
            const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Image', style: TextStyle(fontSize: textWidth)),
                const SizedBox(
                  width: 125, // solo para alinear con los elementos de arriba
                ), /*
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
                ),*/
              ],
            ),
            /*const SizedBox(
              width: 20,
            ),*/
          ],
        ),
      ),
    );
  }

  Container TextContainerWithImage(double screenWidth, context) {
    double textWidth = 25;
    if (screenWidth < 860) {
      textWidth = 17;
    }
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
            Flexible(
              child: SizedBox(
                //image with size
                child: Image.asset(
                  'lib/src/images/cuadro_de_texto.png',
                  //height: 80,
                  fit: BoxFit.contain,

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
                Text('Text', style: TextStyle(fontSize: textWidth)),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => {
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return TextDialog();
                        })
                  },
                  // diseño del boton
                  child: Text('Ver Ejemplos',
                      style: TextStyle(fontSize: textWidth - 4)),

                  // color del boton
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 32, 68, 252),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
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

  Container IconContainer(double screenWidth, context) {
    var iconSizeWidth = screenWidth * 0.12;
    double textWidth = 25;
    if (screenWidth < 860) {
      textWidth = 17;
    }
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        // Color que combina el fondo con el texto
        color: Colors.blueGrey[100],

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () => {},
              // color del boton y tamano del icono
              color: const Color.fromARGB(255, 43, 134, 209),
              iconSize: iconSizeWidth /*40*/,
            ),

            // espacio
            /*const SizedBox(
              width: 40,
            ),*/
            const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Icon', style: TextStyle(fontSize: textWidth)),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return IconDialog();
                        })
                  },
                  // diseño del boton
                  child: Text('Ver Ejemplos',
                      style: TextStyle(fontSize: textWidth - 4)),

                  // color del boton
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 32, 68, 252),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container SearchBarContainer(double screenWidth, context) {
    double textFieldWidth = screenWidth * 0.2;
    double textWidth = 25;
    if (screenWidth < 860) {
      textWidth = 17;
    }
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        // Color que combina el fondo con el texto
        color: Colors.blueGrey[100],

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: textFieldWidth,
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
            /*const SizedBox(
              width: 40,
            ),*/
            //const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Input Text',
                  style: TextStyle(fontSize: textWidth),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => {
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return InputTextDialog();
                        })
                  },
                  // diseño del boton
                  child: Text(
                    'Ver Ejemplos',
                    style: TextStyle(fontSize: textWidth - 4),
                  ),

                  // color del boton
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 32, 68, 252),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80)),
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
    double containerWidth;
    var buttonWidth = screenWeight * 0.025;
    var buttonVerticalSymetric = screenWeight * 0.03;
    var buttonHorizontalSymetric = screenWeight * 0.055;
    if (screenWeight < 860) {
      containerWidth = 17;
      /*} else if (screenWeight > 900) {
      containerWidth = 50;*/
    } else {
      containerWidth = 25;
    }
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10.0),
      //elements in the center of the container
      // the container ajusts the size of the elements
      alignment: Alignment.center,
      child: Card(
        color: Colors.blueGrey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: ElevatedButton(
                onPressed: () => {},
                child: Text(
                  "Button",
                  style: TextStyle(fontSize: buttonWidth),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: /*buttonVerticalSymetric*/ 18,
                      horizontal: buttonHorizontalSymetric /*30*/),
                ),
              ),
            ),
            // espacio entre los elementos
            /*const SizedBox(
              width: 40,
            ),*/
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Text Button',
                    /*style: TextStyle(
                      fontSize:
                          containerWidth),*/
                    style: TextStyle(fontSize: containerWidth)),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => {
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return ButtonDialog();
                        })
                  },
                  // diseño del boton
                  child: Text(
                    'Ver Ejemplos',
                    style: TextStyle(fontSize: containerWidth - 4),
                  ),

                  // color del boton

                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 32, 68, 252),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  LayoutBuilder CheckBoxAndRadioButtonResponsive(int val, context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 420) {
        return CheckBoxAndRadioButtonHorizontal(val, screenWidth);
      } else {
        return CheckBoxAndRadioButtonVertical(val);
      }
    });
  }

  Container CheckBoxAndRadioButtonHorizontal(int val, double screenWidth) {
    var checkboxTextWidth = screenWidth * 0.017;
    var spaceBetweenOptions = screenWidth * 0.01;
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10.0),
      //elements in the center of the container
      // the container ajusts the size of the elements
      alignment: Alignment.center,
      child: Card(
        color: Colors.blueGrey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                        ),
                        Text(
                          'Option',
                          style: TextStyle(
                            fontSize: checkboxTextWidth, //15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spaceBetweenOptions,
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
                        Text(
                          'Option',
                          style: TextStyle(
                            fontSize: checkboxTextWidth, //15,
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
                          child: Text(
                            'Option',
                            style: TextStyle(
                              fontSize: checkboxTextWidth, //15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spaceBetweenOptions,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          //RadioButton is marked with true
                          value: val,
                          onChanged: (value) {},
                          groupValue: 1,
                        ),
                        Text(
                          'Option',
                          style: TextStyle(
                            fontSize: checkboxTextWidth, //15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                /*const SizedBox(
                  width: 20,
                ),*/
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('Checked View', style: TextStyle(fontSize: 25)),
                const SizedBox(
                  height: 10,
                ),
                /*RaisedButton(
                  onPressed: () => {},
                  // diseño del boton
                  child: const Text('Ver Ejemplos'),

                  // color del boton
                  color: const Color.fromARGB(255, 43, 134, 209),
                  // circular shape
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),*/
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
                const Text(
                  'Checked View',
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 20,
                ), /*
                RaisedButton(
                  onPressed: () => {},
                  // diseño del boton
                  child: const Text('Ver Ejemplos'),

                  // color del boton
                  color: const Color.fromARGB(255, 43, 134, 209),
                  // circular shape
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),*/
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
                        Transform.scale(
                          scale: 1,
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
