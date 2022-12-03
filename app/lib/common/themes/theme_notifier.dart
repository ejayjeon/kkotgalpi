import 'package:app/common/themes/theme_preference.dart';
import 'package:flutter/cupertino.dart';

class ThemeNotifier extends ChangeNotifier {
  late bool _isDark;
  late ThemePreference _themePreference;
  bool get isDark => _isDark;

  ThemeNotifier() {
    _isDark = false;
    _themePreference = ThemePreference();
    getPreference();
  }

  // get
  getPreference() async {
    _isDark = await _themePreference.getTheme();
    notifyListeners();
  }

  // Switching the Themes
  set isDark(bool value) {
    _isDark = value;
    _themePreference.setTheme(value);
    notifyListeners();
  }
}
