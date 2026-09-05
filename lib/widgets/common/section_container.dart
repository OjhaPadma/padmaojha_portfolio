import 'package:flutter/material.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_colors.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.backgroundColor,
  });

  final Widget child;
  final String? title;
  final String? subtitle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ColoredBox(
      color: backgroundColor ?? Colors.transparent,
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.maxContentWidth,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(title!, style: textTheme.headlineSmall),
                  const SizedBox(height: AppSpacing.xs),
                  Container(
                    width: 48,
                    height: 3,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Text(subtitle!, style: textTheme.bodyLarge),
                  ],
                  const SizedBox(height: AppSpacing.lg),
                ],
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
