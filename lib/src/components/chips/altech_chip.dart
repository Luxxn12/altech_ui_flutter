import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';

/// Selectable chip component for filtering and tagging.
class AltechChip extends StatelessWidget {
  /// Creates a chip widget.
  const AltechChip({
    super.key,
    required this.label,
    this.avatar,
    this.trailing,
    this.onDeleted,
    this.onTap,
    this.selected = false,
    this.padding,
  });

  final String label;
  final Widget? avatar;
  final Widget? trailing;
  final VoidCallback? onDeleted;
  final VoidCallback? onTap;
  final bool selected;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final borderColor = selected
        ? colorScheme.primary.withValues(alpha: 0.34)
        : colorScheme.outlineVariant.withValues(alpha: 0.75);
    final background = selected
        ? colorScheme.primary.withValues(alpha: 0.12)
        : colorScheme.surface;

    return InkWell(
      borderRadius: BorderRadius.circular(AltechRadius.pill),
      onTap: onTap,
      child: Ink(
        padding:
            padding ??
            const EdgeInsets.symmetric(
              horizontal: AltechSpacing.sm,
              vertical: AltechSpacing.xs,
            ),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(AltechRadius.pill),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (avatar != null) ...[avatar!, const SizedBox(width: 6)],
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: selected ? colorScheme.primary : colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (trailing != null) ...[const SizedBox(width: 6), trailing!],
            if (onDeleted != null) ...[
              const SizedBox(width: 6),
              InkWell(
                onTap: onDeleted,
                borderRadius: BorderRadius.circular(999),
                child: Icon(
                  Icons.close_rounded,
                  size: 14,
                  color: selected
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
