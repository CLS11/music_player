import 'package:flutter/material.dart';
import 'package:music_player/themes/dark_mode.dart';
import 'package:music_player/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //LIGHT MODE
  ThemeData _themeData = lightMode;

  //GETTER FOR LIGHT MODE
  ThemeData get themeData => _themeData;

  //CHECKING IF IT IS A DARK MODE
  bool get isDarkMode => _themeData == darkMode;

  //SETTER FOR SETTING THE THEME
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners(); //Updates the UI
  }

  //TOGGLE THE THEME
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
