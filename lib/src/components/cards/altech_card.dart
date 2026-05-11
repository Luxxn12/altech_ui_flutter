import 'package:flutter/material.dart';

import '../../extensions/build_context_x.dart';
import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';

/// Generic surface card with optional tap handler and custom shadow.
class AltechCard extends StatelessWidget {
  /// Creates a card wrapper.
  const AltechCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AltechSpacing.md),
    this.onTap,
    this.radius = AltechRadius.lg,
    this.elevation = 0,
    this.backgroundColor,
    this.borderColor,
    this.shadow,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final double radius;
  final double elevation;
  final Color? backgroundColor;
  final Color? borderColor;
  final List<BoxShadow>? shadow;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: shadow ?? context.shadows.sm,
      ),
      child: Material(
        color: backgroundColor ?? colorScheme.surface,
        elevation: elevation,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(
            color:
                borderColor ??
                colorScheme.outlineVariant.withValues(alpha: 0.8),
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onTap,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
