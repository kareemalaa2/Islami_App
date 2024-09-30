import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings_Provider extends ChangeNotifier {
  String currentLanguage = 'en';
  ThemeMode currentThemeMode = ThemeMode.dark;

  void changeLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }
  void changeThemeMode(ThemeMode theme) {
    if (currentThemeMode == theme) return;
    currentThemeMode = theme;
    notifyListeners();
  }
  String getHomeBackGround() {
    return currentThemeMode == ThemeMode.dark
        ? 'assets/images/dark_backGround.png'
        : 'assets/images/background.png';

  }

  String getSebhaBackGround() {
    return currentThemeMode == ThemeMode.dark
        ? 'assets/images/dark_body_sebha.png'
        : 'assets/images/body_sebha_logo.png';
  }

  bool isDark() {
    return currentThemeMode == ThemeMode.dark;
  }
}
