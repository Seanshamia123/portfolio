import 'package:flutter/material.dart';
import 'package:portfolio/shared/app_shared_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'app_theme_controller.g.dart';

@riverpod
class AppThemeController extends _$AppThemeController {
  @override
  Future<ThemeMode> build() {
    return AppSharedPref.getAppTheme();
  }

  void changeTheme(ThemeMode theme) async {
    await AppSharedPref.setAppTheme(theme==ThemeMode.dark?'dark':'light');
    update((state)=> theme);
  }
}
