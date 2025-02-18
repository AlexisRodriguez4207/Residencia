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

  // Esto es para guardar la ultima pagina visitada
  set lastpage(String value) {
    _prefs.setString('lastpage', value);
  }

  String get uid {
    // Esto es para retornar el uid del usuario
    return _prefs.getString('uid') ?? '';
  }

  set uid(String value) {
    _prefs.setString('uid', value);
  }

  bool get theme {
    // Esto es para retornar el uid del usuario
    return _prefs.getBool('theme') ?? true;
  }

  set theme(bool value) {
    _prefs.setBool('theme', value);
  }
}
