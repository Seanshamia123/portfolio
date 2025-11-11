import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/project/domain/project.dart';
import 'package:portfolio/widgets/appbar/styled_card.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:portfolio/shared/app_locale_controller.dart';

class ProjectItem extends ConsumerStatefulWidget {
  const ProjectItem({super.key, required this.project});
  final Project project;

  @override
  ConsumerState<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends ConsumerState<ProjectItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(applocaleControllerProvider).value ?? 'en';
    final hasLink = widget.project.link?.trim().isNotEmpty ?? false;
    final linkHost = _extractLinkHost();
    final colors = context.colorscheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        child: StyledCard(
          link: widget.project.link,
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(28),
          borderWidth: 1.2,
          borderColor: _isHovered
              ? colors.primary.withOpacity(0.45)
              : colors.outline.withOpacity(0.2),
          backgroundGradient: LinearGradient(
            colors: [
              colors.surface,
              colors.primary.withOpacity(context.isDesktop ? 0.12 : 0.08),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: colors.primary.withOpacity(_isHovered ? 0.18 : 0.08),
              blurRadius: _isHovered ? 36 : 20,
              offset: const Offset(0, 18),
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildCover(context, hasLink),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SEOText(
                      widget.project.title[locale] ?? '',
                      style: context.textStyle.titleLgBold.copyWith(
                        color: colors.onSurface,
                        height: 1.2,
                      ),
                      textRendererStyle: TextRendererStyle.header4,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(10),
                    SEOText(
                      widget.project.description[locale] ?? '',
                      style: context.textStyle.bodyMdMedium.copyWith(
                        color: colors.onSurfaceVariant,
                        height: 1.5,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (hasLink) ...[
                      const Gap(16),
                      Divider(color: colors.outline.withOpacity(0.2)),
                      const Gap(10),
                      Row(
                        children: [
                          if (linkHost != null) _MetaPill(label: linkHost),
                          const Spacer(),
                          _ViewProjectPill(isHovered: _isHovered),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCover(BuildContext context, bool hasLink) {
    final borderRadius = const BorderRadius.vertical(top: Radius.circular(28));
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: widget.project.imageUrl != null &&
                    widget.project.imageUrl!.isNotEmpty
                ? Image.network(
                    widget.project.imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildPlaceholder(context);
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return _buildPlaceholder(context);
                    },
                  )
                : _buildPlaceholder(context),
          ),
          Positioned.fill(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 220),
              opacity: _isHovered ? 1 : 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.05),
                      context.colorscheme.primary.withOpacity(0.35),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (hasLink)
            const Positioned(
              top: 16,
              left: 16,
              child: _LiveBadge(),
            ),
        ],
      ),
    );
  }

  String? _extractLinkHost() {
    final raw = widget.project.link?.trim();
    if (raw == null || raw.isEmpty) return null;
    final uri = Uri.tryParse(raw);
    if (uri == null) return null;
    if (uri.host.isNotEmpty) {
      return uri.host.replaceFirst('www.', '');
    }
    if (uri.path.isNotEmpty) {
      return uri.path;
    }
    return raw;
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Container(
      color: context.colorscheme.surface,
      child: Center(
        child: Icon(
          Icons.image_outlined,
          size: 64,
          color: context.colorscheme.onSurfaceVariant.withOpacity(0.3),
        ),
      ),
    );
  }
}

class _MetaPill extends StatelessWidget {
  const _MetaPill({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: context.colorscheme.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.public,
            size: 14,
            color: context.colorscheme.primary,
          ),
          const Gap(6),
          Text(
            label,
            style: context.textStyle.bodyMdMedium.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: context.colorscheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ViewProjectPill extends StatelessWidget {
  const _ViewProjectPill({required this.isHovered});
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    final primary = context.colorscheme.primary;
    final onPrimary = context.colorscheme.onPrimary;
    final background = isHovered ? primary : primary.withOpacity(0.12);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutCubic,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'View project',
            style: context.textStyle.bodyMdMedium.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isHovered ? onPrimary : primary,
            ),
          ),
          const Gap(6),
          Icon(
            Icons.arrow_outward_rounded,
            size: 16,
            color: isHovered ? onPrimary : primary,
          ),
        ],
      ),
    );
  }
}

class _LiveBadge extends StatelessWidget {
  const _LiveBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: context.colorscheme.primary,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: context.colorscheme.primary.withOpacity(0.3),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            size: 10,
            color: context.colorscheme.onPrimary,
          ),
          const Gap(6),
          Text(
            'Live now',
            style: context.textStyle.bodyMdMedium.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: context.colorscheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
