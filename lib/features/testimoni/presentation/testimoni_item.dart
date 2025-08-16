import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/home/domain/testimony.dart';
import 'package:portfolio/widgets/appbar/styled_card.dart';

class TestimonyItem extends StatelessWidget {
  const TestimonyItem({super.key, required this.testimony});
  final Testimony testimony;

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      link: testimony.link,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipOval(
                    child: Image.network(
                      testimony.avatar,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.person),
                    ),
                  ),
                ),
              const Gap(16),
              Expanded(
                child: Text(
                  testimony.name,
                  style: context.textStyle.bodyLgBold.copyWith(
                    color: context.colorscheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          const Gap(16),
          Text(
            testimony.text,
            style: context.textStyle.bodyLgMedium.copyWith(
              color: context.colorscheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
