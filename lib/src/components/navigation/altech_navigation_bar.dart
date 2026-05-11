import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';

/// Navigation destination model for [AltechNavigationBar].
class AltechNavigationDestination {
  /// Creates a navigation destination.
  const AltechNavigationDestination({
    required this.icon,
    required this.label,
    this.selectedIcon,
    this.showBadgeDot = false,
  });

  final Widget icon;
  final Widget? selectedIcon;
  final String label;
  final bool showBadgeDot;
}

/// Bottom navigation component with optional floating dock mode.
class AltechNavigationBar extends StatelessWidget {
  /// Creates a navigation bar.
  const AltechNavigationBar({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.floating = false,
    this.height,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.indicatorColor,
  });

  final List<AltechNavigationDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool floating;
  final double? height;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? indicatorColor;

  @override
  Widget build(BuildContext context) {
    if (floating) {
      return _FloatingDock(
        destinations: destinations,
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        height: height,
        backgroundColor: backgroundColor,
        selectedColor: selectedColor,
        unselectedColor: unselectedColor,
        indicatorColor: indicatorColor,
      );
    }

    final bar = NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: destinations
          .map(
            (item) => NavigationDestination(
              icon: item.icon,
              selectedIcon: item.selectedIcon,
              label: item.label,
            ),
          )
          .toList(growable: false),
    );

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(
              context,
            ).colorScheme.outlineVariant.withValues(alpha: 0.7),
          ),
        ),
      ),
      child: bar,
    );
  }
}

class _FloatingDock extends StatelessWidget {
  const _FloatingDock({
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.height,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.indicatorColor,
  });

  final List<AltechNavigationDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final double? height;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? indicatorColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bg =
        backgroundColor ??
        Color.alphaBlend(
          colorScheme.surface.withValues(alpha: 0.86),
          colorScheme.surfaceContainerHigh,
        );
    final selectedFg = selectedColor ?? colorScheme.onSurface;
    final idleFg = unselectedColor ?? colorScheme.onSurfaceVariant;
    final activeIndicator =
        indicatorColor ??
        colorScheme.primary.withValues(
          alpha: Theme.of(context).brightness == Brightness.dark ? 0.32 : 0.2,
        );

    return Container(
      height: height ?? 98,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AltechRadius.xl),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.7),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 28,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Row(
        children: List<Widget>.generate(destinations.length, (index) {
          final destination = destinations[index];
          final selected = index == selectedIndex;

          return Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(AltechRadius.lg),
              onTap: () => onDestinationSelected(index),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 68,
                      height: 34,
                      decoration: BoxDecoration(
                        color: selected ? activeIndicator : Colors.transparent,
                        borderRadius: BorderRadius.circular(AltechRadius.pill),
                      ),
                      child: Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            IconTheme(
                              data: IconThemeData(
                                color: selected ? selectedFg : idleFg,
                                size: 18,
                              ),
                              child: selected
                                  ? (destination.selectedIcon ??
                                        destination.icon)
                                  : destination.icon,
                            ),
                            if (destination.showBadgeDot)
                              const Positioned(
                                right: -1,
                                top: -2,
                                child: CircleAvatar(
                                  radius: 3.2,
                                  backgroundColor: Color(0xFF4D71FF),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AltechSpacing.xs),
                    Text(
                      destination.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: selected ? selectedFg : idleFg,
                        fontWeight: selected
                            ? FontWeight.w700
                            : FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
