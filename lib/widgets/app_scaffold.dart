import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/my_app_bar.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/appbar/background_blur.dart';
import 'package:portfolio/widgets/my_footer.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.slivers});
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundBlur(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(maxWidth: Insets.maxWidth),
              padding: EdgeInsets.only(top: context.insets.appBarHeight),
              child: CustomScrollView(
                slivers: [
                  ...slivers,
                  const SliverToBoxAdapter(child: MyFooter()),
                ],
              ),
            ),
          ),
          const MyAppBar(),
        ],
      ),
    );
  }
}
