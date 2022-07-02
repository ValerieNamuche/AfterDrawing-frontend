// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'package:afterdrawing/src/core/provider/userProvider.dart';
import 'package:afterdrawing/src/endpoints/endpoints.dart';
import 'package:afterdrawing/src/model/RegisterDto.dart';
import 'package:afterdrawing/src/utils/SnackBarNotification.dart';
import 'package:afterdrawing/src/utils/Utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String url = "https://easystory-backend.herokuapp.com/api/";
  TextEditingController userText = new TextEditingController();
  TextEditingController passText = new TextEditingController();
  TextEditingController firstNameText = new TextEditingController();
  TextEditingController lastNameText = new TextEditingController();
  TextEditingController emailText = new TextEditingController();
  //TextEditingController phoneText = new TextEditingController();
  TextEditingController repeatPassText = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Map userBody = new Map();
  bool userValid = true;
  bool passValid = true;
  bool firstNameValid = true;
  bool lastNameValid = true;
  bool emailValid = true;
  //bool phoneValid = true;
  bool repeatPassValid = true;
  bool conditionsAccepted = false;
  var isLoading = false;

  saveFormRegister() {
    setState(() {
      isLoading = true;
    });
    var registerProvider = UserProvider();
    var registerDto = RegisterDto();
    registerDto.email = emailText.text;
    registerDto.firstName = firstNameText.text;
    registerDto.lastName = lastNameText.text;
    registerDto.userName = userText.text;
    registerDto.password = passText.text;

    registerProvider.register(registerDto).then((value) async {
      setState(() {
        isLoading = false;
      });
      if (value == true) {
        await Future.delayed(Duration(
            milliseconds:
                300)); // tiempo que se demora en mostrarse el Snackbar
        SnackBarNotification().showSnackbar(
            Utils.homeNavigator.currentContext!, "Registro exitoso", "success");
        Utils.homeNavigator.currentState!.pushNamed("login");
      } else {
        SnackBarNotification()
            .showSnackbar(Utils.homeNavigator.currentContext!, value, "error");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //var userId;
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
            padding: EdgeInsets.only(top: 50, left: 40, right: 40, bottom: 40),
            children: <Widget>[
              Image.asset(
                'lib/src/images/wireframelogo.png',
                height: 100,
                width: 100,
              ),
              Form(
                  key: _formKey,
                  child: Theme(
                    data: ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: Colors.blue,
                        inputDecorationTheme: const InputDecorationTheme(
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 20))),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: emailText,
                            decoration: InputDecoration(
                              labelText: "Correo",
                              /* errorText:
                                  emailValid ? null : 'Ingrese su correo',*/
                              errorStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 240, 120, 111)),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (String? email) {
                              bool validEmail = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(email!);
                              if (email.isEmpty) {
                                return "Ingrese su correo";
                              } else if (validEmail == false) {
                                return "Correo inválido";
                              } else if (email.length > 50) {
                                return "Ingrese un correo menos extenso";
                              }
                            },
                            textInputAction: TextInputAction.next,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Flexible(
                                  child: TextFormField(
                                    controller: firstNameText,
                                    decoration: InputDecoration(
                                      labelText: "Nombre",
                                      /* errorText: firstNameValid
                                          ? null
                                          : 'Ingrese su nombre',*/
                                      errorStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 240, 120, 111)),
                                    ),
                                    validator: (String? firstName) {
                                      if (firstName!.isEmpty) {
                                        return "Ingrese su Nombre";
                                      } else if (firstName.length > 25) {
                                        return "Valor muy extenso para el campo";
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                                const Spacer(),
                                Flexible(
                                  child: TextFormField(
                                    controller: lastNameText,
                                    decoration: InputDecoration(
                                      labelText: "Apellido",
                                      errorText: lastNameValid
                                          ? null
                                          : 'Ingrese su apellido',
                                      errorStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 240, 120, 111)),
                                    ),
                                    validator: (lastName) {
                                      if (lastName!.isEmpty) {
                                        return 'Ingrese su apellido';
                                      } else if (lastName.length > 25) {
                                        return "Valor muy extenso para el campo";
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ]),
                          /*TextFormField(
                        controller: phoneText,
                        decoration: InputDecoration(
                          labelText: "Teléfono",
                          errorText: phoneValid ? null : 'Ingrese su telefono',
                        ),
                        keyboardType: TextInputType.text,
                      ),*/
                          TextFormField(
                            controller: userText,
                            decoration: InputDecoration(
                              labelText: "Usuario",
                              /* errorText:
                                  userValid ? null : 'Ingrese su usuario',*/
                              errorStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 240, 120, 111)),
                            ),
                            keyboardType: TextInputType.text,
                            validator: (userName) {
                              if (userName!.isEmpty) {
                                return 'Ingrese su usuario';
                              } else if (userName.length > 25) {
                                return "Valor muy extenso para el campo";
                              }
                            },
                            textInputAction: TextInputAction.next,
                          ),
                          TextFormField(
                            controller: passText,
                            decoration: InputDecoration(
                              labelText: "Contraseña",
                              /* errorText:
                                  passValid ? null : 'Ingrese su contraseña',*/
                              errorStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 240, 120, 111)),
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: (password) {
                              if (password!.isEmpty) {
                                return 'Ingrese su contraseña';
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.next,
                          ),
                          TextFormField(
                            controller: repeatPassText,
                            decoration: InputDecoration(
                              labelText: "Repita contraseña",
                              /*errorText: repeatPassValid
                                  ? null
                                  : 'Las contraseñas no coinciden',*/
                              errorStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 240, 120, 111)),
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: (passwordRepeated) {
                              if (passwordRepeated! != passText.text) {
                                return 'Las contraseñas no coinciden';
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.next,
                          ),
                        ],
                      ),
                    ),
                  )),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    /*setState(() {
                      userText.text.isNotEmpty
                          ? userValid = true
                          : userValid = false;
                      passText.text.isNotEmpty
                          ? passValid = true
                          : passValid = false;
                      firstNameText.text.isNotEmpty
                          ? firstNameValid = true
                          : firstNameValid = false;
                      lastNameText.text.isNotEmpty
                          ? lastNameValid = true
                          : lastNameValid = false;
                      emailText.text.isNotEmpty
                          ? emailValid = true
                          : emailValid = false;
                      /*phoneText.text.isNotEmpty
                          ? phoneValid = true
                          : phoneValid = false;*/
                      repeatPassText.text == passText.text
                          ? repeatPassValid = true
                          : repeatPassValid = false;
                    });
                    if (conditionsAccepted &&
                        userValid &&
                        passValid &&
                        firstNameValid &&
                        lastNameValid &&
                        emailValid &&
                        //phoneValid &&
                        repeatPassValid) {
                      userBody = {
                        'username': userText.text.toString(),
                        'password': passText.text.toString(),
                        'firstName': firstNameText.text.toString(),
                        'lastName': lastNameText.text.toString(),
                        'email': emailText.text.toString(),
                        //'telephone': phoneText.text.toString(),
                      };
                      var body = json.encode(userBody);
                      http.Response response = await http.post(
                          Uri.parse(url + "users"),
                          headers: headers(),
                          body: body);
                      print(response);
                      Navigator.pushNamed(context, 'login');
                    }*/

                    /////////////////////
                    if (_formKey.currentState!.validate() &&
                        isLoading == false) {
                      //si el form es valido
                      saveFormRegister();
                      print("Hola, form completo");
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(500, 50)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10)),
                    shape: MaterialStateProperty.all(new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    )),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.deepPurple)
                      : const Text('Registrar'),
                ),
              ),
              Divider(),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.black87,
                      textStyle: TextStyle(fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  child: Text("¿Ya tienes una cuenta? ¡Inicia sesión!"),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
