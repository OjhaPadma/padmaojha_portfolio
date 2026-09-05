import 'package:flutter/material.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/url_helper.dart';
import '../../data/portfolio_content.dart';
import '../../widgets/animations/scroll_reveal.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/section_container.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onContact});

  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final compact = Responsive.isMobile(context);
    final textTheme = Theme.of(context).textTheme;

    final photo = Semantics(
      label: 'Portrait of ${PortfolioContent.name}',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            PortfolioContent.profileImagePath,
            fit: BoxFit.cover,
            width: compact ? 220 : 280,
            height: compact ? 220 : 280,
          ),
        ),
      ),
    );

    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          PortfolioContent.name,
          style: textTheme.displaySmall?.copyWith(fontSize: compact ? 36 : 48),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          PortfolioContent.title,
          style: textTheme.titleLarge?.copyWith(color: AppColors.primaryDark),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(PortfolioContent.location, style: textTheme.bodyMedium),
        const SizedBox(height: AppSpacing.md),
        Text(PortfolioContent.heroSummary, style: textTheme.bodyLarge),
        const SizedBox(height: AppSpacing.lg),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            AppButton(
              label: 'Download Resume',
              icon: Icons.download_outlined,
              onPressed: UrlHelper.openResume,
            ),
            AppButton(
              label: 'Contact Me',
              outlined: true,
              icon: Icons.mail_outline,
              onPressed: onContact,
            ),
          ],
        ),
      ],
    );

    return ColoredBox(
      color: AppColors.surface,
      child: SectionContainer(
        child: ScrollReveal(
          child: compact
              ? Column(
                  children: [
                    SizedBox(width: 220, child: photo),
                    const SizedBox(height: AppSpacing.lg),
                    copy,
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 5, child: copy),
                    const SizedBox(width: AppSpacing.xl),
                    Expanded(flex: 3, child: photo),
                  ],
                ),
        ),
      ),
    );
  }
}
