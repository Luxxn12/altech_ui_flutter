import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';
import '../avatars/altech_avatar.dart';

/// Sidebar item model used by [AltechSidebarNavigation].
class AltechSidebarNavItem {
  /// Creates a sidebar item definition.
  const AltechSidebarNavItem({
    required this.label,
    required this.icon,
    this.badge,
  });

  final String label;
  final IconData icon;
  final String? badge;
}

/// Vertical sidebar navigation for dashboard layouts.
class AltechSidebarNavigation extends StatelessWidget {
  /// Creates a sidebar navigation component.
  const AltechSidebarNavigation({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onChanged,
    this.title = 'Altech UI',
    this.userName,
    this.userEmail,
    this.minWidth = 230,
    this.selectedBackgroundColor,
    this.selectedForegroundColor,
    this.unselectedForegroundColor,
  });

  final List<AltechSidebarNavItem> items;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final String title;
  final String? userName;
  final String? userEmail;
  final double minWidth;
  final Color? selectedBackgroundColor;
  final Color? selectedForegroundColor;
  final Color? unselectedForegroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      constraints: BoxConstraints(minWidth: minWidth),
      padding: const EdgeInsets.all(AltechSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(AltechRadius.lg),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.7),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.bolt_rounded,
                  color: colorScheme.onPrimary,
                  size: 16,
                ),
              ),
              const SizedBox(width: AltechSpacing.xs),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: AltechSpacing.md),
          for (var i = 0; i < items.length; i++) ...[
            _SidebarItemTile(
              item: items[i],
              selected: i == selectedIndex,
              selectedBackgroundColor: selectedBackgroundColor,
              selectedForegroundColor: selectedForegroundColor,
              unselectedForegroundColor: unselectedForegroundColor,
              onTap: () => onChanged(i),
            ),
            const SizedBox(height: AltechSpacing.xs),
          ],
          if (userName != null || userEmail != null) ...[
            const SizedBox(height: AltechSpacing.sm),
            Divider(
              color: colorScheme.outlineVariant.withValues(alpha: 0.7),
              height: AltechSpacing.lg,
            ),
            Row(
              children: [
                const AltechAvatar(initials: 'JD', size: 34),
                const SizedBox(width: AltechSpacing.xs),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (userName != null)
                        Text(
                          userName!,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      if (userEmail != null)
                        Text(
                          userEmail!,
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(color: colorScheme.onSurfaceVariant),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _SidebarItemTile extends StatelessWidget {
  const _SidebarItemTile({
    required this.item,
    required this.selected,
    required this.onTap,
    this.selectedBackgroundColor,
    this.selectedForegroundColor,
    this.unselectedForegroundColor,
  });

  final AltechSidebarNavItem item;
  final bool selected;
  final VoidCallback onTap;
  final Color? selectedBackgroundColor;
  final Color? selectedForegroundColor;
  final Color? unselectedForegroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final selectedBg =
        selectedBackgroundColor ??
        colorScheme.primaryContainer.withValues(
          alpha: Theme.of(context).brightness == Brightness.dark ? 0.42 : 0.72,
        );
    final selectedFg =
        selectedForegroundColor ?? colorScheme.onPrimaryContainer;
    final idleFg = unselectedForegroundColor ?? colorScheme.onSurfaceVariant;

    return InkWell(
      borderRadius: BorderRadius.circular(AltechRadius.pill),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: AltechSpacing.sm,
          vertical: 9,
        ),
        decoration: BoxDecoration(
          color: selected ? selectedBg : Colors.transparent,
          border: Border.all(
            color: selected
                ? colorScheme.primary.withValues(alpha: 0.28)
                : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(AltechRadius.pill),
        ),
        child: Row(
          children: [
            Icon(item.icon, size: 16, color: selected ? selectedFg : idleFg),
            const SizedBox(width: AltechSpacing.xs),
            Expanded(
              child: Text(
                item.label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: selected ? selectedFg : idleFg,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
            if (item.badge != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: selected
                      ? colorScheme.primary.withValues(alpha: 0.16)
                      : colorScheme.primary.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(AltechRadius.pill),
                ),
                child: Text(
                  item.badge!,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: selected ? selectedFg : colorScheme.primary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
