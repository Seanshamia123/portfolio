import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/routes/app_route.dart';

class AppMenuLists {
  static List<AppMenu> getItems(BuildContext context) {
    return [
      AppMenu(title: context.texts.home, path: Routes.home),

      AppMenu(title: context.texts.projects, path: Routes.projects),

      AppMenu(title: context.texts.contact, path: Routes.contact),
    ];
  }
}

class AppMenu {
  final String title;

  final String path;

  AppMenu({required this.title, required this.path});
}
