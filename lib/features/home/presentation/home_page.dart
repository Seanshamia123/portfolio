import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/home/presentation/experience_body.dart';
import 'package:portfolio/features/home/presentation/hero_widget.dart';
import 'package:portfolio/features/home/presentation/home_controller.dart';
import 'package:portfolio/features/home/presentation/home_project_list.dart';
import 'package:portfolio/features/home/presentation/testimoni_list.dart';
import 'package:portfolio/widgets/app_scaffold.dart';
import 'package:portfolio/widgets/home_title_subtitle.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    return AppScaffold(
      slivers: [
        if (state.isLoading)
          const SliverToBoxAdapter(child: CircularProgressIndicator())
        else ...[
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
              child: const HeroWidget(),
            ),
          ),
          SliverGap(context.insets.gap),
          SliverToBoxAdapter(
            child: HomeProjectList(projects: state.value?.projects ?? []),
          ),
          SliverGap(context.insets.gap),
          SliverToBoxAdapter(
            child: ExperienceBody(list: state.value?.experiences ?? []),
          ),
          SliverToBoxAdapter(
            child: HomeTitleSubtitle(
              title: context.texts.testimonies,
              subtitle: context.texts.testimoniesDescription,
            ),
          ),
          const SliverGap(32),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
            sliver: TestimoniList(testimonies: state.value?.testimonies ?? []),
          ),
        ],
      ],
    );
  }
}
