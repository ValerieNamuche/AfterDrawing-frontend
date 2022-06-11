import 'dart:convert';

import 'package:afterdrawing/src/model/RegisterDto.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider {
  Future<dynamic> login(String email, String password) async {
    var url = 'http://localhost:8081/api/v1/authentication/sign-in';

    Uri uri = Uri.parse(url);

    var body = {'email': email, 'password': password};

    var response = await http.post(uri,
        body: json.encode(body),
        headers: {"Accept": "*/*", "Content-Type": "application/json"});

    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(response.body);

      await saveLoginData(jsonResponse); // guarda datos de sesion del usuario
      return true;
    } else if (response.statusCode == 404 || response.statusCode == 403) {
      return "Credenciales inválidos";
    } else {
      return "Ha ocurrido un error en el servidor, intente más tarde";
    }
  }

  Future<void> saveLoginData(jsonResponse) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setInt("userId", jsonResponse['id']);
    prefs.setString("email", jsonResponse['email']);
    prefs.setString("userName", jsonResponse['userName']);
    //prefs.setString("token", jsonResponse['id']);
  }

  Future<void> logout() async {
    var prefs = await SharedPreferences.getInstance();

    prefs.remove("userId");
    prefs.remove("userName");
    prefs.remove("email");
  }

  Future<dynamic> register(RegisterDto registerDto) async {
    var url = 'http://localhost:8081/api/v1/authentication/sign-up';

    Uri uri = Uri.parse(url);

    var body = registerDto.toJson();

    var response = await http.post(uri, body: json.encode(body), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      dynamic jsonResponse = json.decode(response.body);
      return jsonResponse['message'];
    }
  }

  Future<dynamic> forgotPassword(String email, String newPassword) async {
    var url = 'http://localhost:8081/api/v1/authentication/forgot-password';

    Uri uri = Uri.parse(url);

    var body = {'email': email, 'newPassword': newPassword};

    var response = await http.post(uri,
        body: json.encode(body),
        headers: {"Accept": "*/*", "Content-Type": "application/json"});

    dynamic jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      //await saveLoginData(jsonResponse); // guarda datos de sesion del usuario
      return true;
    } else {
      return jsonResponse['message'];
    }
  }
}
