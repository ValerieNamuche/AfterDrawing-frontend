import 'package:afterdrawing/src/pages/ForgotPassword.dart';
import 'package:afterdrawing/src/pages/Home.dart';
//import 'package:afterdrawing/src/pages/GenerateInterfaces1.dart';
//import 'package:afterdrawing/src/pages/GenerateInterfaces2.dart';
import 'package:afterdrawing/src/pages/Login.dart';
import 'package:afterdrawing/src/pages/Register.dart';
import 'package:afterdrawing/src/pages/guide/GuideElement.dart';
import 'package:afterdrawing/src/pages/interfaces/GenerateInterfaces1.dart';
import 'package:afterdrawing/src/pages/interfaces/GenerateInterfaces2.dart';
import 'package:afterdrawing/src/pages/interfaces/SaveInterface.dart';
import 'package:afterdrawing/src/pages/projects/Project.dart';
import 'package:afterdrawing/src/pages/projects/ProjectDetails.dart';
import 'package:afterdrawing/src/pages/projects/ProjectEdit.dart';
import 'package:afterdrawing/src/pages/projects/WireframeView.dart';
import 'package:afterdrawing/src/utils/Utils.dart';
import 'package:afterdrawing/src/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  //const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool barStateToUser = false;

  _updateMyBarStateToUser(bool state) {
    setState(() {
      barStateToUser = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      isUsserLogged: barStateToUser,
      body: Navigator(
        key: Utils.homeNavigator,
        initialRoute: "generate_interfaces1",
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    Widget view = GenerateInterfaces1();

    switch (settings.name) {
      case "generate_interfaces1":
        view = GenerateInterfaces1();
        break;
      case 'home':
        view = Home();
        break;
      case "login":
        view = LoginPage(
          changeStateUserLog: _updateMyBarStateToUser,
        );
        break;
      case "register":
        view = RegisterPage();
        break;
      case "forgot_password":
        view = ForgotPassword();
        break;
      case 'project':
        // dirigir a la pagina de proyectos
        view = ProjectList();
        break;
      case "guide":
        view = GuideElement();
        break;
      case "generate_interfaces2":
        view = GenerateInterfaces2();
        break;
      case 'project_details':
        view = ProjectDetails();
        break;
      case 'wireframeview':
        view = WireframeView();
        break;
      case 'save_interface':
        view = SaveInterface();
        break;
      case 'project_edit':
        view = ProjectEdit();
        break;
      default:
        print("Nombre de subruta: " + settings.name!);
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return view;
      },
      settings: settings,
    );
  }
}
