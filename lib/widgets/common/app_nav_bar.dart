import 'package:flutter/material.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../data/portfolio_content.dart';

class NavItem {
  const NavItem({required this.label, required this.keyRef});

  final String label;
  final GlobalKey keyRef;
}

class AppNavBar extends StatelessWidget {
  const AppNavBar({
    super.key,
    required this.items,
    required this.onItemSelected,
    required this.menuOpen,
    required this.onMenuToggle,
  });

  final List<NavItem> items;
  final ValueChanged<GlobalKey> onItemSelected;
  final bool menuOpen;
  final VoidCallback onMenuToggle;

  @override
  Widget build(BuildContext context) {
    final compact = Responsive.isMobile(context);

    return Material(
      color: AppColors.surface.withValues(alpha: 0.96),
      elevation: 0,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.line)),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        child: SafeArea(
          bottom: false,
          child: compact ? _MobileBar(this) : _DesktopBar(this),
        ),
      ),
    );
  }
}

class _DesktopBar extends StatelessWidget {
  const _DesktopBar(this.parent);

  final AppNavBar parent;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          PortfolioContent.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        for (final item in parent.items)
          Padding(
            padding: const EdgeInsets.only(left: AppSpacing.sm),
            child: TextButton(
              onPressed: () => parent.onItemSelected(item.keyRef),
              child: Text(item.label),
            ),
          ),
      ],
    );
  }
}

class _MobileBar extends StatelessWidget {
  const _MobileBar(this.parent);

  final AppNavBar parent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              PortfolioContent.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            IconButton(
              tooltip: parent.menuOpen ? 'Close menu' : 'Open menu',
              onPressed: parent.onMenuToggle,
              icon: Icon(parent.menuOpen ? Icons.close : Icons.menu),
            ),
          ],
        ),
        if (parent.menuOpen)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final item in parent.items)
                TextButton(
                  onPressed: () => parent.onItemSelected(item.keyRef),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(item.label),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
