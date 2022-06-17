import 'package:afterdrawing/router.dart';
import 'package:afterdrawing/src/core/bloc/userBloc.dart';
import 'package:afterdrawing/src/core/provider/userProvider.dart';
import 'package:afterdrawing/src/pages/Home.dart';
import 'package:afterdrawing/src/utils/SnackBarNotification.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/Utils.dart';

class CustomNavBar extends StatefulWidget {
  //Este es el que voy a utilizar
  final Widget body;
  bool? isUsserLogged = false;
  CustomNavBar({Key? key, required this.body, this.isUsserLogged})
      : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  var userProvider = UserProvider();

  var userBloc = UserBloc();
  var email = "";
  var userName = "user";
  //ya no se usa
  var isLogged = false;

//Solo para hotreload
  @override
  void initState() {
    userBloc.getUserData().then((userData) {
      if (userData.isNotEmpty) {
        setState(() {
          widget.isUsserLogged = true;
          email = userData[1];
          userName = userData[2];
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,

      appBar: AppBar(
        title: Image.asset('lib/src/images/wireframelogo.png',
            width: 65, height: 60, alignment: Alignment.bottomRight),
        toolbarHeight: 65,
        actions:
            widget.isUsserLogged! ? WidgetsToUserView() : WidgetsWithoutUser(),
      ),
      body: widget.body,
    );
  }

  WidgetsToUserView() {
    userBloc.getUserData().then((userData) {
      if (userData.length > 1) {
        setState(() {
          widget.isUsserLogged = true;
          email = userData[1];
          userName = userData[2];
        });
      }
    });

    return [
      /*ElevatedButton(
          onPressed: () {
            Utils.homeNavigator.currentState!.pushNamed("home");
          },
          child: Text(
            "Inicio",
            style: TextStyle(fontSize: 17),
          )),*/
      ElevatedButton(
          onPressed: () {
            Utils.homeNavigator.currentState!.pushNamed("generate_interfaces1");
          },
          child: Text(
            "Generador",
            style: TextStyle(fontSize: 17),
          )),
      ElevatedButton(
          onPressed: () {
            Utils.homeNavigator.currentState!.pushNamed("guide");
          },
          child: Text("Guía", style: TextStyle(fontSize: 17))),
      /////
      ElevatedButton(
          onPressed: () {
            Utils.homeNavigator.currentState!.pushNamed("project");
          },
          child: Text("Projectos", style: TextStyle(fontSize: 17))),
      Padding(
        //log out
        padding: EdgeInsets.only(right: 30),
        child: PopupMenuButton<int>(
          onSelected: (item) => onSelected(context, item),
          itemBuilder: (context) => [
            PopupMenuItem<int>(
                value: 0,
                child: Text(
                  userName,
                  style: TextStyle(fontSize: 17),
                )),
            PopupMenuItem<int>(
                value: 1,
                child: Text(
                  'Cerrar sesión',
                  style: TextStyle(fontSize: 17),
                ))
          ],
        ),
      )
    ];
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        userProvider.logout().then((value) async {
          widget.isUsserLogged = false;
          await Future.delayed(Duration(milliseconds: 300));
          SnackBarNotification().showSnackbar(
              Utils.homeNavigator.currentContext!,
              "Sesión cerrada exitosamente",
              "success");

          Utils.homeNavigator.currentState!.pushNamed("generate_interfaces1");
        });
        break;
    }
  }

  WidgetsWithoutUser() {
    return [
      ElevatedButton(
          onPressed: () {
            Utils.homeNavigator.currentState!.pushNamed("home");
          },
          child: Text(
            "Inicio",
            style: TextStyle(fontSize: 17),
          )),
      ElevatedButton(
          onPressed: () {
            Utils.homeNavigator.currentState!.pushNamed("generate_interfaces1");
          },
          child: Text(
            "Generador",
            style: TextStyle(fontSize: 17),
          )),
      ElevatedButton(
          onPressed: () {
            Utils.homeNavigator.currentState!.pushNamed("guide");
          },
          child: Text("Guía", style: TextStyle(fontSize: 17))),
      //////////
      Padding(
        padding: EdgeInsets.only(right: 30),
        child: ElevatedButton(
            onPressed: () {
              Utils.homeNavigator.currentState!.pushNamed("login");
            },
            child: Text("Login", style: TextStyle(fontSize: 17))),
      ),
    ];
  }
}
