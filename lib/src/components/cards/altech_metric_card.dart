import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';
import '../buttons/altech_button.dart';

enum MetricCardVariant { light, dark }

class AltechMetricCard extends StatelessWidget {
  const AltechMetricCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.tag,
    this.trend,
    this.icon,
    this.variant = MetricCardVariant.light,
    this.primaryActionLabel,
    this.secondaryActionLabel,
    this.onPrimaryAction,
    this.onSecondaryAction,
  });

  final String title;
  final String value;
  final String? subtitle;
  final String? tag;
  final String? trend;
  final IconData? icon;
  final MetricCardVariant variant;
  final String? primaryActionLabel;
  final String? secondaryActionLabel;
  final VoidCallback? onPrimaryAction;
  final VoidCallback? onSecondaryAction;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = variant == MetricCardVariant.dark;
    final foreground = isDark ? Colors.white : colorScheme.onSurface;
    final subtitleColor = isDark
        ? Colors.white.withValues(alpha: 0.72)
        : colorScheme.onSurfaceVariant;

    return Container(
      padding: const EdgeInsets.all(AltechSpacing.md),
      decoration: BoxDecoration(
        gradient: isDark
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF151820), Color(0xFF0E1118)],
              )
            : null,
        color: isDark ? null : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(AltechRadius.lg),
        border: Border.all(
          color: isDark
              ? const Color(0xFF1F2432)
              : Theme.of(
                  context,
                ).colorScheme.outlineVariant.withValues(alpha: 0.8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null)
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.08)
                        : colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    size: 18,
                    color: isDark ? Colors.white : colorScheme.primary,
                  ),
                ),
              if (icon != null) const SizedBox(width: AltechSpacing.xs),
              if (tag != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.08)
                        : const Color(0xFFEAF8EE),
                    borderRadius: BorderRadius.circular(AltechRadius.pill),
                  ),
                  child: Text(
                    tag!,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: isDark ? Colors.white70 : const Color(0xFF16945A),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: AltechSpacing.md),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: foreground,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 6),
            Text(
              subtitle!,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: subtitleColor),
            ),
          ],
          const SizedBox(height: AltechSpacing.sm),
          Row(
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (trend != null) ...[
                const SizedBox(width: 8),
                Text(
                  trend!,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: const Color(0xFF16A34A),
                  ),
                ),
              ],
            ],
          ),
          if (primaryActionLabel != null && secondaryActionLabel != null) ...[
            const SizedBox(height: AltechSpacing.md),
            Row(
              children: [
                Expanded(
                  child: AltechButton(
                    text: primaryActionLabel!,
                    variant: isDark
                        ? ButtonVariant.tonal
                        : ButtonVariant.primary,
                    onPressed: onPrimaryAction,
                  ),
                ),
                const SizedBox(width: AltechSpacing.xs),
                Expanded(
                  child: AltechButton(
                    text: secondaryActionLabel!,
                    variant: isDark
                        ? ButtonVariant.secondary
                        : ButtonVariant.outline,
                    onPressed: onSecondaryAction,
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
