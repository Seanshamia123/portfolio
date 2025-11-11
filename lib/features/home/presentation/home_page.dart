import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/home/presentation/experience_body.dart';
import 'package:portfolio/features/home/presentation/hero_widget.dart';
import 'package:portfolio/features/home/presentation/home_controller.dart';
import 'package:portfolio/features/home/presentation/home_project_list.dart';
import 'package:portfolio/features/home/presentation/testimoni_list.dart';
import 'package:portfolio/features/home/presentation/review_submission_form.dart';
import 'package:portfolio/widgets/app_scaffold.dart';
import 'package:portfolio/widgets/home_title_subtitle.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    return AppScaffold(
      slivers: state.when(
        loading: () => const [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
        error: (error, _) => [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Connection issue',
                    style: context.textStyle.titleLgBold.copyWith(
                      color: context.colorscheme.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(16),
                  Text(
                    'We could not reach the API. Please check that the backend server is running and try again.',
                    style: context.textStyle.bodyMdMedium.copyWith(
                      color: context.colorscheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(24),
                  ElevatedButton(
                    onPressed: () => ref.invalidate(homeControllerProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        ],
        data: (home) => [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
              child: const HeroWidget(),
            ),
          ),
          SliverGap(context.insets.gap),
          SliverToBoxAdapter(
            child: HomeProjectList(projects: home.projects),
          ),
          SliverGap(context.insets.gap),
          SliverToBoxAdapter(
            child: ExperienceBody(list: home.experiences),
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
            sliver: TestimoniList(testimonies: home.testimonies),
          ),
          const SliverGap(48),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
            sliver: const SliverToBoxAdapter(
              child: ReviewSubmissionForm(),
            ),
          ),
          const SliverGap(48),
        ],
      ),
    );
  }
}
