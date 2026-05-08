import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';

class AltechBadge extends StatelessWidget {
  const AltechBadge({
    super.key,
    required this.label,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
  });

  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding:
          padding ??
          const EdgeInsets.symmetric(
            horizontal: AltechSpacing.sm,
            vertical: AltechSpacing.xs,
          ),
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(AltechRadius.pill),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelMedium?.copyWith(
          color: foregroundColor ?? theme.colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}
