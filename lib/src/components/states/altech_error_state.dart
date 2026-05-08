import 'package:flutter/material.dart';

import '../../theme/spacing/altech_spacing.dart';

class AltechErrorState extends StatelessWidget {
  const AltechErrorState({
    super.key,
    required this.title,
    required this.message,
    this.actionLabel = 'Retry',
    this.onRetry,
  });

  final String title;
  final String message;
  final String actionLabel;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AltechSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 52,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: AltechSpacing.sm),
            Text(
              title,
              style: theme.textTheme.titleMedium,
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
              FilledButton(onPressed: onRetry, child: Text(actionLabel)),
            ],
          ],
        ),
      ),
    );
  }
}
