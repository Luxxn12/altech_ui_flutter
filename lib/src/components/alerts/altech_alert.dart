import 'package:flutter/material.dart';

import '../../extensions/build_context_x.dart';
import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';
import '../buttons/altech_button.dart';
import 'alert_type.dart';

abstract final class AltechAlert {
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    AlertType type = AlertType.info,
    String actionText = 'Got it',
    VoidCallback? onAction,
    bool barrierDismissible = true,
    bool showCloseButton = true,
  }) {
    final style = _styleOf(context, type);

    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AltechRadius.xl),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
          actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: style.soft,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(style.icon, color: style.strong, size: 22),
                  ),
                  const SizedBox(width: AltechSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          message,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: context.colors.onSurfaceVariant,
                              ),
                        ),
                      ],
                    ),
                  ),
                  if (showCloseButton)
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.close_rounded,
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                ],
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: AltechButton(
                text: actionText,
                variant: ButtonVariant.primary,
                onPressed: () {
                  Navigator.of(context).pop();
                  onAction?.call();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  static _AlertStyle _styleOf(BuildContext context, AlertType type) {
    final semantic = context.semanticColors;

    switch (type) {
      case AlertType.success:
        return _AlertStyle(
          soft: semantic.success.withValues(alpha: 0.12),
          strong: semantic.success,
          icon: Icons.check_circle_rounded,
        );
      case AlertType.error:
        return _AlertStyle(
          soft: semantic.error.withValues(alpha: 0.12),
          strong: semantic.error,
          icon: Icons.error_rounded,
        );
      case AlertType.warning:
        return _AlertStyle(
          soft: semantic.warning.withValues(alpha: 0.16),
          strong: semantic.warning,
          icon: Icons.warning_rounded,
        );
      case AlertType.info:
        return _AlertStyle(
          soft: semantic.info.withValues(alpha: 0.12),
          strong: semantic.info,
          icon: Icons.info_rounded,
        );
    }
  }
}

class _AlertStyle {
  const _AlertStyle({
    required this.soft,
    required this.strong,
    required this.icon,
  });

  final Color soft;
  final Color strong;
  final IconData icon;
}
