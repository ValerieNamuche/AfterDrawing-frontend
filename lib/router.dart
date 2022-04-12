import 'package:afterdrawing/src/pages/Home.dart';
import 'package:afterdrawing/src/pages/Login.dart';
import 'package:afterdrawing/src/pages/Project.dart';
import 'package:afterdrawing/src/pages/Register.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // var userId = 1;
  switch (settings.name) {
    case 'login':
      return MaterialPageRoute(builder: (context) => LoginPage());
    case 'project':
      // dirigir a la pagina de proyectos
      return MaterialPageRoute(builder: (context) => ProjectList());
    case 'register':
      // dirigir a la pagina de proyectos
      return MaterialPageRoute(builder: (context) => RegisterPage());
    case 'home':
      // dirigir a la pagina de proyectos
      return MaterialPageRoute(builder: (context) => Home());
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}
