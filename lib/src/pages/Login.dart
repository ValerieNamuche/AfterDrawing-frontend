import 'package:afterdrawing/src/core/provider/userProvider.dart';
import 'package:afterdrawing/src/endpoints/endpoints.dart';
import 'package:afterdrawing/src/utils/SnackBarNotification.dart';
import 'package:afterdrawing/src/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/gestures.dart';

class LoginPage extends StatefulWidget {
  final ValueChanged<bool>? changeStateUserLog;
  const LoginPage({Key? key, this.changeStateUserLog}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String url = "https://easystory-backend.herokuapp.com/api/";
  TextEditingController userText = new TextEditingController();
  TextEditingController passText = new TextEditingController();
  List dataUsers = [];
  bool userExists = false;
  bool userValid = true;
  bool passValid = true;
  var isPasswordHidden = true;
  var isLoading = false;

  var userProvider = UserProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userId;
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const Image(
            image: AssetImage('lib/src/images/fondologin.jpg'),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          ListView(
            padding: const EdgeInsets.only(
                top: 210, left: 40, right: 40, bottom: 40),
            children: <Widget>[
              Image.asset(
                'lib/src/images/wireframelogo.png',
                height: 100,
                width: 100,
              ),
              Form(
                  child: Theme(
                data: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: const InputDecorationTheme(
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 20))),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 40.0, top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: userText,
                        decoration: InputDecoration(
                          labelText: "Ingresa correo",
                          errorText: userValid ? null : 'Ingrese un usuario',
                          errorStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 240, 120, 111)),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      TextFormField(
                        controller: passText,
                        decoration: InputDecoration(
                          labelText: "Ingresa contraseña",
                          errorText:
                              passValid ? null : 'Ingrese una contraseña',
                          errorStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 240, 120, 111)),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordHidden = !isPasswordHidden;
                                });
                              },
                              icon: isPasswordHidden
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off)),
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        obscureText: isPasswordHidden,
                      ),
                    ],
                  ),
                ),
              )),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    /*for (var cosa in dataUsers) {
                      if (cosa['username'] == userText.text) {
                        userExists = true;
                        userId = cosa['id'];
                      }
                    }*/
                    setState(() {
                      userText.text.isNotEmpty
                          ? userValid = true
                          : userValid = false;
                      passText.text.isNotEmpty
                          ? passValid = true
                          : passValid = false;
                      //isLoading = true;
                    });
                    if (userValid && passValid && isLoading == false) {
                      print(userText.text);
                      print(passText.text);
                      setState(() {
                        isLoading = true;
                      });
                      userProvider
                          .login(userText.text, passText.text)
                          .then((value) async {
                        if (value == true) {
                          await Future.delayed(Duration(
                              milliseconds:
                                  300)); // tiempo que se demora en mostrarse el Snackbar
                          SnackBarNotification().showSnackbar(
                              Utils.homeNavigator.currentContext!,
                              "Logeado exitoso",
                              "success");
                          widget.changeStateUserLog!(true);
                          Utils.homeNavigator
                              .currentState! // posible cambio posterior
                              .pushNamed("generate_interfaces1");
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          print(value);
                          await Future.delayed(Duration(milliseconds: 300));
                          SnackBarNotification().showSnackbar(
                              Utils.homeNavigator.currentContext!,
                              value,
                              "error");
                        }
                      });
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(400, 50)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.deepPurple)
                      : const Text('Iniciar sesión'),
                ),
              ),
              const Divider(),
              Center(
                child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.black87,
                        textStyle: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.of(context).pushNamed('register');
                    },
                    child: Text("¿No tienes una cuenta? !Registrate!")),
              ),
              const Divider(),
              Center(
                child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.black87,
                        textStyle: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.pushNamed(context, 'forgot_password');
                    },
                    child: Text("¿Olvidaste tu contraseña?")),
              )
            ],
          ),
        ],
      ),
    );
  }
}
