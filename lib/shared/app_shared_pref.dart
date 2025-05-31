import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static const localeKey = 'app_locale';
  static const themeKey = 'app_theme';
  static Future<void> setAppTheme(String theme) async {
    final SharedPref = await SharedPreferences.getInstance();
    SharedPref.setString(themeKey, theme);
  }

  static Future<ThemeMode> getAppTheme() async {
    final SharedPref = await SharedPreferences.getInstance();
    return SharedPref.getString(themeKey) == 'light'
        ? ThemeMode.light
        : ThemeMode.dark;
  }

  static Future<void> setAppLocale(String locale) async {
    final SharedPref = await SharedPreferences.getInstance();
    SharedPref.setString(localeKey, locale);
  }

  static Future<String> getAppLocale() async {
    final SharedPref = await SharedPreferences.getInstance();
    return SharedPref.getString(localeKey) ?? 'en';
  }
}
