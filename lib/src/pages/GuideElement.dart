import 'package:flutter/material.dart';

//Create a GridView of 6 elements
class GuideElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guía de elementos Reconocidos'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          // insert the elements here we have a widget for each element like buttons, text, images etc. like an interface

          //Checkbox and  RadioButton elements in Flutter
          Container(
            width: 100,
            padding: const EdgeInsets.all(10.0),
            //elements in the center of the container
            // the container ajusts the size of the elements
            alignment: Alignment.center,
            child: Expanded(
              //elements in the center of the center
              // the center ajusts the size of the aplication
              child: Card(
                color: Colors.blueGrey[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // a table 2x2 with checkbox and radio button inside
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Checkbox(
                                    value: true,
                                    onChanged: (value) {},
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Option',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Radio(
                                    value: true,
                                    onChanged: (value) {},
                                    groupValue: 1,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Option',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      // a table 2x2 with checkbox and radio button inside
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Checkbox(
                                    value: false,
                                    onChanged: (value) {},
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Option',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Radio(
                                    //RadioButton is marked with true
                                    value: false,
                                    onChanged: (value) {},
                                    groupValue: 2,
                                    toggleable: true,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Option',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      //set text and button
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Checked View'),
                          SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                            onPressed: () => {},
                            // diseño del boton
                            child: Text('Ver Ejemplos'),

                            // color del boton
                            color: Color.fromARGB(255, 43, 134, 209),
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
          ),
//Button in container
          Container(
            width: 100,
            padding: const EdgeInsets.all(10.0),
            //elements in the center of the container
            // the container ajusts the size of the elements
            alignment: Alignment.center,
            child: Expanded(
              //elements in the center of the center
              // the center ajusts the size of the aplication
              child: Card(
                color: Colors.blueGrey[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: RaisedButton(
                        onPressed: () => {},
                        child: Text("Button"),
                      ),
                    ),
                    // espacio entre los elementos
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      // set text and button in a Column
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Button Text'),
                          SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                            onPressed: () => {},
                            // diseño del boton
                            child: Text('Ver Ejemplos'),

                            // color del boton
                            color: Color.fromARGB(255, 43, 134, 209),
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
          ),
          // search bar using the search bar widget (ganador)
          Container(
            width: 100,
            padding: const EdgeInsets.all(10.0),
            child: Expanded(
              child: Card(
                // Color que combina el fondo con el texto
                color: Colors.blueGrey[100],

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      child: Container(
                        width: 100,
                        //two text fields
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 100,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: 'Label',
                                ),
                              ),
                            ),

                            Divider(
                              height: 25,
                              color: Colors.transparent,
                            ),
                            // other label
                            SizedBox(
                              width: 100,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: 'Input Text',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // espacio
                    SizedBox(
                      width: 40,
                    ),
                    Divider(),
                    Container(
                      // set text and button in a Column
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Input Text'),
                          SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                            onPressed: () => {},
                            // diseño del boton
                            child: Text('Ver Ejemplos'),

                            // color del boton
                            color: Color.fromARGB(255, 43, 134, 209),
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
          ),

          Container(
            width: 100,
            padding: const EdgeInsets.all(10.0),
            child: Expanded(
              child: Card(
                // Color que combina el fondo con el texto
                color: Colors.blueGrey[100],

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      child: Container(
                        width: 100,
                        //two text fields
                        child: IconButton(
                          icon: Icon(Icons.home),
                          onPressed: () => {},
                          // color del boton y tamano del icono
                          color: Color.fromARGB(255, 43, 134, 209),
                          iconSize: 40,
                        ),
                      ),
                    ),

                    // espacio
                    SizedBox(
                      width: 40,
                    ),
                    Divider(),
                    Container(
                      // set text and button in a Column
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Input Text'),
                          SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                            onPressed: () => {},
                            // diseño del boton
                            child: Text('Ver Ejemplos'),

                            // color del boton
                            color: Color.fromARGB(255, 43, 134, 209),
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
          ),
        ],
      ),
    );
  }
}

// Create a Enum from widgets like buttons, searchbars, scrollbar,etc

