import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/my_app_bar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';

part 'drawer_menu.g.dart';

class DrawerMenu extends ConsumerStatefulWidget {
  const DrawerMenu({super.key});

  @override
  ConsumerState<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );
  late final _animation = Tween<Offset>(
    begin: const Offset(0, -1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(drawerMenuControllerProvider, (previous, next) {
      if (next == true) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    return ClipRRect(
      child: SlideTransition(
        position: _animation,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.colorscheme.surface,
            boxShadow: [
              BoxShadow(
                color: context.colorscheme.surface.withOpacity(0.4),
                blurRadius: 6,
                spreadRadius: 3,
              ),
            ],
          ),
          child: const SmallMenu(),
        ),
      ),
    );
  }
}

@riverpod
class DrawerMenuController extends _$DrawerMenuController {
  @override
  bool build() {
    return false;
  }

  void open() {
    state = true;
  }

  void close() {
    state = false;
  }
}
