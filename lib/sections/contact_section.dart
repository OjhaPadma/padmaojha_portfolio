import 'package:flutter/material.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/url_helper.dart';
import '../../data/portfolio_content.dart';
import '../../widgets/animations/scroll_reveal.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/section_container.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Contact',
      subtitle:
          'Email is the fastest way to reach me. LinkedIn and GitHub are linked below.',
      child: ScrollReveal(
        child: Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            _ContactTile(
              icon: Icons.mail_outline,
              label: 'Email',
              value: PortfolioContent.email,
              onTap: () =>
                  UrlHelper.open(PortfolioContent.mailto, newTab: false),
            ),
            _ContactTile(
              icon: Icons.work_outline,
              label: 'LinkedIn',
              value: 'padma-ojha',
              onTap: () => UrlHelper.open(PortfolioContent.linkedInUrl),
            ),
            _ContactTile(
              icon: Icons.code,
              label: 'GitHub',
              value: 'OjhaPadma',
              onTap: () => UrlHelper.open(PortfolioContent.githubUrl),
            ),
            _ContactTile(
              icon: Icons.location_on_outlined,
              label: 'Location',
              value: PortfolioContent.location,
            ),
            AppButton(
              label: 'Send email',
              icon: Icons.mail_outline,
              onPressed: () =>
                  UrlHelper.open(PortfolioContent.mailto, newTab: false),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radius),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radius),
          border: Border.all(color: AppColors.line),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.primary, size: 18),
              const SizedBox(width: AppSpacing.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: Theme.of(context).textTheme.bodySmall),
                  Text(value, style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
