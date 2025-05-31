import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/home/domain/testimony.dart';
import 'package:portfolio/features/testimoni/presentation/testimoni_item.dart';

class TestimoniList extends StatelessWidget {
  const TestimoniList({super.key, required this.testimonies});
  final List<Testimony> testimonies;
  @override
  Widget build(BuildContext context) {
    return context.isDesktopOrTablet
        ? _DesktopTestimony(testimonies: testimonies)
        : _PhoneTestimony(testimonies: testimonies);
  }
}

class _DesktopTestimony extends StatelessWidget {
  const _DesktopTestimony({required this.testimonies});
  final List<Testimony> testimonies;

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return TestimonyItem(testimony: testimonies[index]);
      }, childCount: testimonies.length),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isDesktop ? 3 : 2,
      ),
    );
  }
}

class _PhoneTestimony extends StatelessWidget {
  const _PhoneTestimony({required this.testimonies});
  final List<Testimony> testimonies;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return TestimonyItem(testimony: testimonies[index]);
      },
      separatorBuilder: (context, index) => const Gap(16),
      itemCount: testimonies.length,
    );
  }
}
