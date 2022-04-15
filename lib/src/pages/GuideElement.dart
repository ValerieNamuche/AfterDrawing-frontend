import 'dart:ui';

import 'package:flutter/material.dart';

//Create a GridView of 6 elements
class GuideElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        // insert the elements here we have a widget for each element like buttons, text, images etc. like an interface

        //Button in container
        Container(
          //elements in the center of the container
          // the container ajusts the size of the elements
          alignment: Alignment.center,
          child: Expanded(
            child: Center(
              //elements in the center of the center
              // the center ajusts the size of the aplication
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(onPressed: () => {}, child: Text("Button")),
                    Text('Button'),
                  ],
                ),
              ),
            ),
          ),
          padding: const EdgeInsets.all(8.0),
        ),
//field
        Container(
            width: 100,
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Center(
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'SearchBar',
                          ),
                        ),
                      ),
                      // espacio
                      SizedBox(
                        width: 10,
                      ),
                      Text('SearchBar'),
                    ],
                  ),
                ),
              ),
            )),
        // search bar using the search bar widget (ganador)
        Container(
          width: 100,
          padding: const EdgeInsets.all(10.0),
          child: Expanded(
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'SearchBar',
                      ),
                    ),
                  ),
                  // espacio
                  SizedBox(
                    width: 40,
                  ),
                  Divider(),
                  Container(
                    child: Text('A search Bar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Create a Enum from widgets like buttons, searchbars, scrollbar,etc

