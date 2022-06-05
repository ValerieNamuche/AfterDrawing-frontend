import 'package:shared_preferences/shared_preferences.dart';

class UserBloc {
  Future<bool> isUserLogged() async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.containsKey("userId");
  }

  //Vere si no me da error
  Future<List<dynamic>> getUserData() async {
    var prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("userId")) {
      return [
        prefs.getInt("userId"),
        prefs.getString("email"),
        prefs.getString("userName")
      ];
    } else {
      return [];
    }
  }
}
