import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/app_text_style.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/shared/app_theme_controller.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/appbar/Language_Switch.dart';
import 'package:portfolio/widgets/appbar/app_bar_drawer_icon.dart';
import 'package:portfolio/widgets/appbar/drawer_menu.dart';
import 'Constants/app_menu_lists.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          height: context.insets.appBarHeight,
          color: context.theme.appBarTheme.backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: Insets.maxWidth),
            child: Row(
              children: [
                Applogo(),
                Spacer(),
                if (context.isDesktop) LargeMenu(),
                Spacer(),
                LanguageSwitch(),
                ThemeToggle(),
                if (!context.isDesktop) AppBarDrawerIcon(),
              ],
            ),
          ),
        ),
        if (!context.isDesktop) DrawerMenu(),
      ],
    );
  }
}

class Applogo extends StatelessWidget {
  const Applogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Portfolio', style: context.textStyle.titleLgBold);
  }
}

class LargeMenu extends StatelessWidget {
  const LargeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          AppMenuLists.getItems(context)
              .map(
                (AppMenu e) => LargeAppBarMenuItem(
                  text: e.title,
                  isSelected: GoRouterState.of(context).fullPath == e.path,
                  onTap: () {
                    GoRouter.of(context).go(e.path);
                  },
                ),
              )
              .toList(),
    );
  }
}

class SmallMenu extends StatelessWidget {
  const SmallMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          AppMenuLists.getItems(context)
              .map(
                (AppMenu e) => LargeAppBarMenuItem(
                  text: e.title,
                  isSelected: GoRouterState.of(context).fullPath == e.path,
                  onTap: () {
                    GoRouter.of(context).go(e.path);
                  },
                ),
              )
              .toList(),
    );
  }
}

class LargeAppBarMenuItem extends StatelessWidget {
  const LargeAppBarMenuItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.med,
          vertical: Insets.xs,
        ),
        child: Text(
          text,
          style: SmallTextStyle().bodyLgMedium.copyWith(
            color:
                isSelected
                    ? context.colorscheme.onSurface
                    : context.colorscheme.onSecondaryFixedVariant,
          ),
        ),
      ),
    );
  }
}

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(appThemeControllerProvider);
    return Switch(
      value: state.value == ThemeMode.dark,
      onChanged: (value) {
        ref
            .read(appThemeControllerProvider.notifier)
            .changeTheme(value ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }
}
