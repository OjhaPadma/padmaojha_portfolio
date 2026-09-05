import 'package:flutter/material.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/experience.dart';
import '../../data/portfolio_content.dart';
import '../../widgets/animations/scroll_reveal.dart';
import '../../widgets/common/section_container.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ...PortfolioContent.experience,
      PortfolioContent.earlyCareer,
    ];

    return SectionContainer(
      title: 'Experience',
      subtitle:
          'Achievement-focused timeline, with earlier roles kept compact.',
      child: ScrollReveal(
        child: Column(
          children: [
            for (var i = 0; i < items.length; i++)
              _TimelineTile(
                experience: items[i],
                isLast: i == items.length - 1,
              ),
          ],
        ),
      ),
    );
  }
}

class _TimelineTile extends StatelessWidget {
  const _TimelineTile({required this.experience, required this.isLast});

  final Experience experience;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 28,
            child: Column(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                if (!isLast)
                  Expanded(child: Container(width: 2, color: AppColors.line)),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.role,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '${experience.company} · ${experience.location}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryDark,
                    ),
                  ),
                  Text(
                    experience.dates,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  for (final bullet in experience.bullets)
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('•  '),
                          Expanded(
                            child: Text(
                              bullet,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
