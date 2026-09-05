import 'package:flutter/material.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/url_helper.dart';
import '../../data/portfolio_content.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;

    return ColoredBox(
      color: AppColors.ink,
      child: Align(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.maxContentWidth,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.lg,
            ),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                Text(
                  '© $year ${PortfolioContent.name}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      tooltip: 'LinkedIn',
                      onPressed: () =>
                          UrlHelper.open(PortfolioContent.linkedInUrl),
                      icon: const Icon(Icons.work_outline, color: Colors.white),
                    ),
                    IconButton(
                      tooltip: 'GitHub',
                      onPressed: () =>
                          UrlHelper.open(PortfolioContent.githubUrl),
                      icon: const Icon(Icons.code, color: Colors.white),
                    ),
                    IconButton(
                      tooltip: 'Email',
                      onPressed: () => UrlHelper.open(
                        PortfolioContent.mailto,
                        newTab: false,
                      ),
                      icon: const Icon(Icons.mail_outline, color: Colors.white),
                    ),
                    TextButton(
                      onPressed: UrlHelper.openResume,
                      child: const Text(
                        'Resume',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Built with Flutter',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
