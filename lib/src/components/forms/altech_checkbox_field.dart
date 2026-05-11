import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';

/// Checkbox list tile wrapped as a reusable form control.
class AltechCheckboxField extends StatelessWidget {
  /// Creates a checkbox form field.
  const AltechCheckboxField({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.subtitle,
    this.compact = false,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final String? subtitle;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: compact
          ? const EdgeInsets.symmetric(horizontal: 2)
          : const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.7),
        ),
        borderRadius: BorderRadius.circular(AltechRadius.sm),
      ),
      child: CheckboxListTile(
        value: value,
        onChanged: onChanged,
        title: Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        subtitle: subtitle == null ? null : Text(subtitle!),
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AltechSpacing.xs,
        ),
        dense: compact,
        visualDensity: compact ? VisualDensity.compact : VisualDensity.standard,
        activeColor: colorScheme.primary,
        checkColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}
