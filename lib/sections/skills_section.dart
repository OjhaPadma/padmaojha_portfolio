import 'package:flutter/material.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_colors.dart';
import '../../data/portfolio_content.dart';
import '../../widgets/animations/scroll_reveal.dart';
import '../../widgets/common/section_container.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  IconData _iconFor(String name) {
    return switch (name) {
      'phone' => Icons.phone_iphone,
      'sync' => Icons.sync,
      'speed' => Icons.speed,
      'rocket' => Icons.rocket_launch_outlined,
      _ => Icons.work_outline,
    };
  }

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Skills & services',
      subtitle:
          'What I use day to day, and how I can help on a product or migration.',
      child: ScrollReveal(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 900
                    ? 4
                    : constraints.maxWidth >= 600
                    ? 2
                    : 1;
                final width =
                    (constraints.maxWidth - (AppSpacing.sm * (columns - 1))) /
                    columns;
                return Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    for (final service in PortfolioContent.services)
                      SizedBox(
                        width: width,
                        child: _ServiceCard(
                          title: service.title,
                          description: service.description,
                          icon: _iconFor(service.iconName),
                        ),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            for (final group in PortfolioContent.skillGroups) ...[
              Text(group.title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: AppSpacing.xs),
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                children: [
                  for (final item in group.items) Chip(label: Text(item)),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
            ],
          ],
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radius),
        boxShadow: const [
          BoxShadow(
            color: Color(0x140F172A),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(height: AppSpacing.sm),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.xs),
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
