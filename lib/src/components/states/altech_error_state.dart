import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';
import '../buttons/altech_button.dart';

class AltechErrorState extends StatelessWidget {
  const AltechErrorState({
    super.key,
    required this.title,
    required this.message,
    this.actionLabel = 'Retry',
    this.onRetry,
    this.icon = Icons.error_outline_rounded,
  });

  final String title;
  final String message;
  final String actionLabel;
  final VoidCallback? onRetry;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AltechSpacing.lg),
      decoration: BoxDecoration(
        color: theme.colorScheme.error.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AltechRadius.lg),
        border: Border.all(
          color: theme.colorScheme.error.withValues(alpha: 0.26),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: theme.colorScheme.error.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 30, color: theme.colorScheme.error),
          ),
          const SizedBox(height: AltechSpacing.sm),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AltechSpacing.xs),
          Text(
            message,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: AltechSpacing.md),
            AltechButton(
              text: actionLabel,
              variant: ButtonVariant.destructive,
              isExpanded: false,
              onPressed: onRetry,
            ),
          ],
        ],
      ),
    );
  }
}
