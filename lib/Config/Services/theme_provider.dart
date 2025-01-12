import 'package:flutter/material.dart';
import 'package:residencia_v2/Config/Preferences/shared_preferences.dart';
import 'package:residencia_v2/Config/Theme/theme.dart';

var prefs = UserPreferences();

class ThemeProvider extends ChangeNotifier {
  // variable para cambiar los temas de la aplicación
  ThemeData _themeData = prefs.theme ? lightTheme : darkTheme;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void switchTheme() {
    if (_themeData == lightTheme) {
      themeData = darkTheme;
      prefs.theme = false;
    } else {
      themeData = lightTheme;
      prefs.theme = true;
    }
  }
}
