import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/project/domain/project.dart';
import 'package:portfolio/widgets/appbar/styled_card.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:portfolio/shared/app_locale_controller.dart';

/// Simpler, more compact project card for home page
class HomeProjectCard extends ConsumerStatefulWidget {
  const HomeProjectCard({super.key, required this.project});
  final Project project;

  @override
  ConsumerState<HomeProjectCard> createState() => _HomeProjectCardState();
}

class _HomeProjectCardState extends ConsumerState<HomeProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(applocaleControllerProvider).value ?? 'en';
    final hasLink = widget.project.link?.trim().isNotEmpty ?? false;
    final colors = context.colorscheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        child: StyledCard(
          link: widget.project.link,
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(20),
          borderWidth: 1,
          borderColor: _isHovered
              ? colors.primary.withOpacity(0.3)
              : colors.outline.withOpacity(0.15),
          boxShadow: [
            BoxShadow(
              color: colors.primary.withOpacity(_isHovered ? 0.12 : 0.05),
              blurRadius: _isHovered ? 24 : 16,
              offset: const Offset(0, 8),
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Compact image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
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
                    // Subtle overlay on hover
                    if (_isHovered)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                colors.primary.withOpacity(0.2),
                              ],
                            ),
                          ),
                        ),
                      ),
                    // Live badge (smaller)
                    if (hasLink)
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: colors.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 8,
                                color: colors.onPrimary,
                              ),
                              const Gap(4),
                              Text(
                                'Live',
                                style: context.textStyle.bodyMdMedium.copyWith(
                                  fontSize: 11,
                                  color: colors.onPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              // Compact content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SEOText(
                      widget.project.title[locale] ?? '',
                      style: context.textStyle.titleMdMedium.copyWith(
                        color: colors.onSurface,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      textRendererStyle: TextRendererStyle.header4,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(8),
                    SEOText(
                      widget.project.description[locale] ?? '',
                      style: context.textStyle.bodyMdMedium.copyWith(
                        color: colors.onSurfaceVariant,
                        fontSize: 14,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (hasLink) ...[
                      const Gap(12),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            size: 14,
                            color: colors.primary,
                          ),
                          const Gap(4),
                          Text(
                            'View',
                            style: context.textStyle.bodyMdMedium.copyWith(
                              fontSize: 13,
                              color: colors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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

  Widget _buildPlaceholder(BuildContext context) {
    return Container(
      color: context.colorscheme.surface,
      child: Center(
        child: Icon(
          Icons.image_outlined,
          size: 48,
          color: context.colorscheme.onSurfaceVariant.withOpacity(0.3),
        ),
      ),
    );
  }
}
