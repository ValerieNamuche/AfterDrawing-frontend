import 'package:afterdrawing/src/pages/GuideElement.dart';
import 'package:afterdrawing/src/utils/tab_controller_handle.dart';
import 'package:afterdrawing/src/widgets/custom_nav_bar.dart';
import 'package:afterdrawing/src/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'dart:html';

import '../utils/content_view.dart';
import '../widgets/custom_tab.dart';
import 'Home.dart';

// pagina donde agrego las interfaces
class GenerateInterfaces1 extends StatefulWidget {
  @override
  _GenerateInterfacesState1 createState() => _GenerateInterfacesState1();
}

class _GenerateInterfacesState1 extends State<GenerateInterfaces1>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  late double screenHeight;
  late double screenWidth;
  late double topPadding;
  late double bottomPadding;
  late double sidePadding;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
    //itemScrollController = ItemScrollController();
  }

  List<ContentView> contentViews = [
    ContentView(tab: CustomTab(title: "Home"), content: Home()),
    ContentView(
      tab: CustomTab(title: 'Generador'),
      content: GenerateInterfaces1(),
    ),
    ContentView(
      tab: CustomTab(title: 'Guia'),
      content: GuideElement(),
    )
  ];

  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        /// Tab Bar
        Container(
          height: screenHeight * 0.05,
          child: CustomTabBar(
              controller: tabController,
              tabs: contentViews.map((e) => e.tab).toList()),
        ),

        /// Tab Bar View
        /*Container(
          height: screenHeight * 0.8,
          child: TabControllerHandler(
            tabController: tabController,
            child: TabBarView(
              controller: tabController,
              children: contentViews.map((e) => e.content).toList(),
            ),
          ),
        ),*/

        /// Bottom Bar
        //BottomBar()
      ],
    );
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
      appBar: AppBar(
        title: CustomNavBar(),
        //title: const Text('Crear Interfaces'),
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
