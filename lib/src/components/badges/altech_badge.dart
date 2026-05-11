import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';

/// Visual variants for [AltechBadge].
enum AltechBadgeVariant { neutral, info, success, warning, danger }

/// Compact badge for labels, states, and counters.
class AltechBadge extends StatelessWidget {
  /// Creates a badge widget.
  const AltechBadge({
    super.key,
    required this.label,
    this.variant = AltechBadgeVariant.neutral,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.padding,
    this.dot,
    this.icon,
  });

  final String label;
  final AltechBadgeVariant variant;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final Color? dot;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = _styleOf(theme, variant);
    final effectiveBackground = backgroundColor ?? style.background;
    final effectiveForeground = foregroundColor ?? style.foreground;
    final effectiveBorder = borderColor ?? style.border;

    return Container(
      padding:
          padding ??
          const EdgeInsets.symmetric(
            horizontal: AltechSpacing.sm,
            vertical: AltechSpacing.xs,
          ),
      decoration: BoxDecoration(
        color: effectiveBackground,
        border: Border.all(color: effectiveBorder),
        borderRadius: BorderRadius.circular(AltechRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: effectiveForeground),
            const SizedBox(width: 5),
          ],
          if (dot != null) ...[
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
            ),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: effectiveForeground,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  _BadgeStyle _styleOf(ThemeData theme, AltechBadgeVariant variant) {
    final colorScheme = theme.colorScheme;

    return switch (variant) {
      AltechBadgeVariant.neutral => _BadgeStyle(
        background: colorScheme.surfaceContainerLowest,
        foreground: colorScheme.onSurfaceVariant,
        border: colorScheme.outlineVariant.withValues(alpha: 0.72),
      ),
      AltechBadgeVariant.info => _BadgeStyle(
        background: colorScheme.primary.withValues(alpha: 0.12),
        foreground: colorScheme.primary,
        border: colorScheme.primary.withValues(alpha: 0.22),
      ),
      AltechBadgeVariant.success => const _BadgeStyle(
        background: Color(0xFFEAF8EE),
        foreground: Color(0xFF16945A),
        border: Color(0xFFB8E8CB),
      ),
      AltechBadgeVariant.warning => const _BadgeStyle(
        background: Color(0xFFFFF7E8),
        foreground: Color(0xFFC67208),
        border: Color(0xFFF6DEAF),
      ),
      AltechBadgeVariant.danger => const _BadgeStyle(
        background: Color(0xFFFFEEF0),
        foreground: Color(0xFFD12345),
        border: Color(0xFFF7C8D0),
      ),
    };
  }
}

class _BadgeStyle {
  const _BadgeStyle({
    required this.background,
    required this.foreground,
    required this.border,
  });

  final Color background;
  final Color foreground;
  final Color border;
}
