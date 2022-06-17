// ignore_for_file: deprecated_member_use

import 'package:afterdrawing/src/core/provider/userProvider.dart';
import 'package:afterdrawing/src/utils/SnackBarNotification.dart';
import 'package:afterdrawing/src/utils/Utils.dart';
import 'package:flutter/material.dart';

// vista de la pagina de recuperar contraseña
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var userProvider = UserProvider();
  var emailExistingController = TextEditingController();
  var newPasswordController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // imagen de fondo usando una imagen de lib/src/images/fondologin.jpg
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
                height: 150,
                width: 150,
              ),
              // texto de recuperar contraseña
              const Center(
                child: Text(
                  'Ingresa tu correo electrónico para recuperar tu contraseña',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    // cursiva
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: emailExistingController,
                      decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        errorStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 240, 120, 111)),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Este campo no puede estar vacio';
                        } else {
                          return null;
                        }
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    TextFormField(
                      controller: newPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Nueva contraseña',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        errorStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 240, 120, 111)),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Este campo no puede estar vacio';
                        } else {
                          return null;
                        }
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      // tamaño del boton
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(const Size(400, 50)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          userProvider
                              .forgotPassword(emailExistingController.text,
                                  newPasswordController.text)
                              .then((value) {
                            if (value == true) {
                              SnackBarNotification().showSnackbar(
                                  Utils.homeNavigator.currentContext!,
                                  "Contraseña cambiada exitosamente",
                                  "success");
                              Utils.homeNavigator.currentState!.pop();
                            } else {
                              SnackBarNotification().showSnackbar(
                                  Utils.homeNavigator.currentContext!,
                                  value,
                                  "error");
                            }
                          });
                        }
                      },
                      child: const Text(
                        'Enviar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
