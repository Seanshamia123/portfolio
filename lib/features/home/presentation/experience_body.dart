import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/experiences/data/domain/experience.dart';
import 'package:portfolio/shared/app_locale_controller.dart';
import 'package:portfolio/widgets/appbar/styled_card.dart';
import 'package:portfolio/widgets/home_title_subtitle.dart';

const expPointsSize = 16.0;
const expScaleFactor = 150.0;
const expPointFactor = expHeight / 2 - expPointsSize / 2;

class ExperienceBody extends StatelessWidget {
  const ExperienceBody({super.key, required this.list});
  final List<Experience> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleSubtitle(
          title: context.texts.experiences,
          subtitle: context.texts.experienceDescription,
        ),
        const Gap(32),
        context.isDesktop
            ? DesktopExperienceBody(list: list)
            : PhoneExperienceBody(list: list),
      ],
    );
  }
}

class DesktopExperienceBody extends StatelessWidget {
  const DesktopExperienceBody({super.key, required this.list});
  final List<Experience> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: list.length * expScaleFactor + expScaleFactor,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 3,
              height: list.length * expScaleFactor + expScaleFactor,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colorscheme.primary.withOpacity(0),
                    context.colorscheme.primary,
                    context.colorscheme.primary.withOpacity(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          for (int i = 0; i < list.length; i++) ...[
            if (i.isEven)
              PositionedDirectional(
                top: i * 150,
                end: 400,
                start: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExperienceItem(experience: list[i]),
                    SizedBox(
                      width: 100,
                      child: DottedLine(
                        dashColor: context.colorscheme.onSurface,
                      ),
                    ),
                  ],
                ),
              )
            else
              PositionedDirectional(
                top: i * 150,
                start: 400,
                end: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: DottedLine(
                        dashColor: context.colorscheme.onSurface,
                      ),
                    ),
                    ExperienceItem(experience: list[i]),
                  ],
                ),
              ),
            PositionedDirectional(
              top: i * expScaleFactor + expPointFactor,
              start: 0,
              end: 0,
              child: Container(
                alignment: Alignment.center,
                width: expPointsSize,
                height: expPointsSize,
                decoration: BoxDecoration(
                  color: context.colorscheme.onSurface.withOpacity(0.25),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: expPointsSize / 2,
                  height: expPointsSize / 2,
                  decoration: BoxDecoration(
                    color: context.colorscheme.onSurface.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class PhoneExperienceBody extends StatelessWidget {
  const PhoneExperienceBody({super.key, required this.list});
  final List<Experience> list;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          for (var i = 0; i < list.length; i++) ...[
            ExperienceItem(experience: list[i]),
            if (i < list.length)
              const SizedBox(
                height: 60,
                child: DottedLine(
                  dashColor: Colors.white,
                  direction: Axis.vertical,
                ),
              ),
          ],
        ],
      ),
    );
  }
}

const expWidth = 300.0;
const expHeight = 230.0;

class ExperienceItem extends ConsumerWidget {
  const ExperienceItem({super.key, required this.experience});
  final Experience experience;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(applocaleControllerProvider).value ?? 'en';
    final descriptionLines = experience.description[locale]
            ?.split('\n')
            .map((line) => line.trim())
            .where((line) => line.isNotEmpty)
            .toList() ??
        [];

    return StyledCard(
      width: expWidth,
      height: expHeight,
      borderEffect: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.title[locale] ?? '',
            style: context.textStyle.titleLgBold.copyWith(
              color: context.colorscheme.onSurface,
              fontSize: context.isDesktop ? 20 : 18,
            ),
          ),
          if (descriptionLines.isNotEmpty) ...[
            const Gap(12),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    for (var i = 0; i < descriptionLines.length; i++)
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: i == descriptionLines.length - 1 ? 0 : 8,
                        ),
                        child: _ExprienceDecriptionItem(
                          description: descriptionLines[i],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ] else
            const Spacer(),
        ],
      ),
    );
  }
}

class _ExprienceDecriptionItem extends StatelessWidget {
  const _ExprienceDecriptionItem({required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorscheme.onSurface,
          ),
        ),
        const Gap(6),
        Expanded(
          child: Text(
            description,
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.colorscheme.onSurfaceVariant,
              fontWeight: FontWeight.w400,
              fontSize: context.isDesktop ? 14 : 13,
              height: 1.45,
            ),
          ),
        ),
      ],
    );
  }
}
