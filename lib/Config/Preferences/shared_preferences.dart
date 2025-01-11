import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _prefs;

  static Future init() async {
    // Esto es para inicializar las preferencias del usuario
    _prefs = await SharedPreferences.getInstance();
  }

  String get lastpage {
    // Esto es para retornar el uid del usuario
    return _prefs.getString('lastpage') ?? '/dashboard';
  }

  set lastpage(String value) {
    _prefs.setString('lastpage', value);
  }

  String get uid {
    // Esto es para retornar el uid del usuario
    return _prefs.getString('uid') ?? '';
  }

  // Esto es para guardar la ultima pagina visitada
  set uid(String value) {
    _prefs.setString('uid', value);
  }
}
