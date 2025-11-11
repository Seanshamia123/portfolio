import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/app_scaffold.dart';
import 'package:portfolio/widgets/appbar/styled_card.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:url_launcher/link.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  static const _email = 'seanzuri12@gmail.com';
  static const _phone = '+254 795 684 258';
  static const _location = 'Nairobi, Kenya';
  static const _timezone = 'GMT +3 (EAT)';

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(
      horizontal: context.insets.padding,
      vertical: context.isMobile ? 32 : 48,
    );

    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: padding,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ContactHero(
                      title: context.texts.contactPageTitle,
                      description: context.texts.contactPageDescription,
                      email: _email,
                      phone: _phone,
                    ),
                    const Gap(32),
                    _ContactMethodGrid(
                      methods: [
                        _ContactMethodData(
                          icon: Icons.mail_outline_rounded,
                          title: 'Send an email',
                          subtitle: 'I respond within one business day',
                          value: _email,
                          link: 'mailto:$_email',
                        ),
                        _ContactMethodData(
                          icon: Icons.phone_outlined,
                          title: 'Call or WhatsApp',
                          subtitle: 'Available 9am – 6pm ($_timezone)',
                          value: _phone,
                          link: 'tel:${_phone.replaceAll(' ', '')}',
                        ),
                        _ContactMethodData(
                          icon: Icons.location_on_outlined,
                          title: 'Home base',
                          subtitle: 'Always open to remote collaborations',
                          value: _location,
                        ),
                        _ContactMethodData(
                          icon: Icons.bolt_outlined,
                          title: 'Response promise',
                          subtitle: 'Friendly, thoughtful updates every step',
                          value: 'Under 24 hours',
                        ),
                      ],
                    ),
                    const Gap(32),
                    const _AvailabilityCard(
                      location: _location,
                      timezone: _timezone,
                    ),
                    if (!context.isMobile) const Gap(32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactHero extends StatelessWidget {
  const _ContactHero({
    required this.title,
    required this.description,
    required this.email,
    required this.phone,
  });

  final String title;
  final String description;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorscheme;
    return Container(
      padding: EdgeInsets.all(context.isMobile ? 24 : 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          colors: [
            colors.primary.withOpacity(0.1),
            colors.surface,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: colors.primary.withOpacity(0.2),
        ),
      ),
      child: Wrap(
        spacing: 32,
        runSpacing: 24,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SizedBox(
            width: context.isDesktop ? 220 : 160,
            child: CircleAvatar(
              radius: context.isDesktop ? 100 : 80,
              backgroundImage:
                  Image.asset('assets/images/about_picture.jpeg').image,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: context.isDesktop ? 560 : double.infinity,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SEOText(
                  title,
                  style: context.textStyle.titleLgBold.copyWith(
                    fontSize: context.isDesktop ? 36 : 28,
                    color: colors.onSurface,
                  ),
                ),
                const Gap(12),
                Text(
                  'Let\'s build delightful products together. '
                  'Tell me about your timeline, tech stack, or simply drop a hello—'
                  'I read every message personally.',
                  style: context.textStyle.bodyMdMedium.copyWith(
                    color: colors.onSurfaceVariant,
                    height: 1.6,
                  ),
                ),
                const Gap(12),
                Text(
                  description,
                  style: context.textStyle.bodyMdMedium.copyWith(
                    color: colors.onSurfaceVariant,
                    height: 1.6,
                  ),
                ),
                const Gap(20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: const [
                    _ContactTag(label: 'Freelance & contracts'),
                    _ContactTag(label: 'Product strategy'),
                    _ContactTag(label: 'Flutter & Dart'),
                  ],
                ),
                const Gap(24),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _ContactCTA(
                      label: 'Email me',
                      icon: Icons.send_rounded,
                      uri: Uri.parse('mailto:$email'),
                      primary: true,
                    ),
                    _ContactCTA(
                      label: 'Schedule a call',
                      icon: Icons.calendar_today_outlined,
                      uri: Uri.parse(
                        'https://wa.me/${phone.replaceAll(RegExp(r'[^0-9]'), '')}',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCTA extends StatelessWidget {
  const _ContactCTA({
    required this.label,
    required this.icon,
    required this.uri,
    this.primary = false,
  });

  final String label;
  final IconData icon;
  final Uri uri;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: uri,
      target: LinkTarget.blank,
      builder: (context, followLink) {
        final buttonChild = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18),
            const Gap(8),
            Text(label),
          ],
        );

        if (primary) {
          return FilledButton(
            onPressed: followLink,
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              textStyle: context.textStyle.bodyMdMedium,
            ),
            child: buttonChild,
          );
        }
        return OutlinedButton(
          onPressed: followLink,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            textStyle: context.textStyle.bodyMdMedium,
          ),
          child: buttonChild,
        );
      },
    );
  }
}

class _ContactTag extends StatelessWidget {
  const _ContactTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: context.colorscheme.primary.withOpacity(0.08),
      ),
      child: Text(
        label,
        style: context.textStyle.bodyMdMedium.copyWith(
          color: context.colorscheme.primary,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _ContactMethodGrid extends StatelessWidget {
  const _ContactMethodGrid({required this.methods});

  final List<_ContactMethodData> methods;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: methods
          .map(
            (method) => SizedBox(
              width: context.isMobile ? double.infinity : 240,
              child: _ContactMethodCard(method: method),
            ),
          )
          .toList(),
    );
  }
}

class _ContactMethodCard extends StatelessWidget {
  const _ContactMethodCard({required this.method});
  final _ContactMethodData method;

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      link: method.link,
      borderRadius: BorderRadius.circular(24),
      padding: const EdgeInsets.all(24),
      borderColor: context.colorscheme.outline.withOpacity(0.2),
      backgroundGradient: LinearGradient(
        colors: [
          context.colorscheme.surface,
          context.colorscheme.primary.withOpacity(0.05),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: context.colorscheme.primary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              method.icon,
              color: context.colorscheme.primary,
            ),
          ),
          const Gap(16),
          Text(
            method.title,
            style: context.textStyle.titleSmBold.copyWith(
              color: context.colorscheme.onSurface,
            ),
          ),
          const Gap(8),
          Text(
            method.subtitle,
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.colorscheme.onSurfaceVariant,
              height: 1.4,
            ),
          ),
          const Gap(12),
          SEOText(
            method.value,
            style: context.textStyle.bodyLgBold.copyWith(
              color: context.colorscheme.onSurface,
            ),
            textRendererStyle: TextRendererStyle.paragraph,
          ),
        ],
      ),
    );
  }
}

class _ContactMethodData {
  const _ContactMethodData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    this.link,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String value;
  final String? link;
}

class _AvailabilityCard extends StatelessWidget {
  const _AvailabilityCard({
    required this.location,
    required this.timezone,
  });

  final String location;
  final String timezone;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorscheme;
    return StyledCard(
      borderRadius: BorderRadius.circular(28),
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 20 : 32,
        vertical: context.isMobile ? 24 : 32,
      ),
      backgroundGradient: LinearGradient(
        colors: [
          colors.primary.withOpacity(0.12),
          colors.surface,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderColor: colors.primary.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Currently welcoming new collaborations',
            style: context.textStyle.titleMdMedium.copyWith(
              color: colors.onSurface,
            ),
          ),
          const Gap(12),
          Text(
            'Whether it\'s a product audit, a brand-new MVP, or long-term feature work, '
            'I can jump in quickly and keep you updated with transparent timelines.',
            style: context.textStyle.bodyMdMedium.copyWith(
              color: colors.onSurfaceVariant,
              height: 1.6,
            ),
          ),
          const Gap(20),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              _AvailabilityMeta(
                icon: Icons.place_outlined,
                label: location,
              ),
              _AvailabilityMeta(
                icon: Icons.schedule_outlined,
                label: timezone,
              ),
              const _AvailabilityMeta(
                icon: Icons.people_alt_outlined,
                label: 'Open to remote teams worldwide',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AvailabilityMeta extends StatelessWidget {
  const _AvailabilityMeta({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 18,
          color: context.colorscheme.primary,
        ),
        const Gap(8),
        Text(
          label,
          style: context.textStyle.bodyMdMedium.copyWith(
            color: context.colorscheme.onSurface,
          ),
        ),
      ],
    );
  }
}
