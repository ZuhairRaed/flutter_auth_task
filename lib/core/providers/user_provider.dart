import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier{

  UserProvider._();

  late SharedPreferences prefs;
  Future<UserProvider> initState() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

   Locale? appLang;
   ThemeMode? appTheme;
   String? idToken;

   static final UserProvider _instance = UserProvider._internal();
  factory UserProvider() => _instance;
  UserProvider._internal() {
    initState();
  }

  Future<String> getAppLanguage() async {
    var lang = await getString('AppLang') ?? 'en';
    appLang = Locale(lang);
    appLang = Locale(lang);
    notifyListeners();
    return lang;
  }

  Future<String> getAppTheme() async {
    String? theme = await getString('AppTheme') ?? ' ';
    if (theme == 'dark') {
      appTheme = ThemeMode.dark;
    } else if (theme == 'light') {
      appTheme = ThemeMode.light;
    } else {
      appTheme = ThemeMode.light;
    }
    notifyListeners();
    return theme;
  }

  void setAppLanguage(String lang) {
    appLang = Locale(lang);
    setString('AppLang', lang);
    notifyListeners();
  }

  void setAppTheme(ThemeMode theme) {
    appTheme = theme;
    if (theme == ThemeMode.dark) {
      setString('AppTheme', 'dark');
    } else {
      setString('AppTheme', 'light');
    }
    notifyListeners();
  }

  void setUser(String token) {
    idToken = token;
    setString('Token', token);
    notifyListeners();
  }

  void setString(String key, String? value) {
    if (value == null) {
      prefs.remove(key);
      return;
    }
    prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    return prefs.getString(key);
  }
}