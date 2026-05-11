import 'package:flutter/material.dart';

import '../../extensions/build_context_x.dart';
import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';
import 'alert_type.dart';

/// Inline feedback banner for non-blocking status updates.
class AltechFeedbackBanner extends StatelessWidget {
  /// Creates a feedback banner.
  const AltechFeedbackBanner({
    super.key,
    required this.title,
    required this.message,
    this.type = AlertType.info,
    this.trailing,
  });

  final String title;
  final String message;
  final AlertType type;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final style = _styleOf(context, type);

    return Container(
      padding: const EdgeInsets.all(AltechSpacing.md),
      decoration: BoxDecoration(
        color: style.soft,
        borderRadius: BorderRadius.circular(AltechRadius.lg),
        border: Border.all(color: style.border),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: style.strong.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(style.icon, color: style.strong, size: 18),
          ),
          const SizedBox(width: AltechSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: AltechSpacing.sm),
            trailing!,
          ],
        ],
      ),
    );
  }

  _FeedbackStyle _styleOf(BuildContext context, AlertType type) {
    final semantic = context.semanticColors;

    return switch (type) {
      AlertType.success => _FeedbackStyle(
        strong: semantic.success,
        soft: semantic.success.withValues(alpha: 0.1),
        border: semantic.success.withValues(alpha: 0.22),
        icon: Icons.check_circle_outline_rounded,
      ),
      AlertType.error => _FeedbackStyle(
        strong: semantic.error,
        soft: semantic.error.withValues(alpha: 0.1),
        border: semantic.error.withValues(alpha: 0.22),
        icon: Icons.error_outline_rounded,
      ),
      AlertType.warning => _FeedbackStyle(
        strong: semantic.warning,
        soft: semantic.warning.withValues(alpha: 0.1),
        border: semantic.warning.withValues(alpha: 0.24),
        icon: Icons.warning_amber_rounded,
      ),
      AlertType.info => _FeedbackStyle(
        strong: semantic.info,
        soft: semantic.info.withValues(alpha: 0.1),
        border: semantic.info.withValues(alpha: 0.2),
        icon: Icons.info_outline_rounded,
      ),
    };
  }
}

class _FeedbackStyle {
  const _FeedbackStyle({
    required this.strong,
    required this.soft,
    required this.border,
    required this.icon,
  });

  final Color strong;
  final Color soft;
  final Color border;
  final IconData icon;
}
