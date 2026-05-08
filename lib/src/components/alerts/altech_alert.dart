import 'package:flutter/material.dart';

import '../../extensions/build_context_x.dart';
import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';
import 'alert_type.dart';

abstract final class AltechAlert {
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    AlertType type = AlertType.info,
    String actionText = 'OK',
    VoidCallback? onAction,
    bool barrierDismissible = true,
  }) {
    final style = _styleOf(context, type);

    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AltechRadius.md),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: style.backgroundColor,
                      borderRadius: BorderRadius.circular(AltechRadius.sm),
                    ),
                    child: Icon(style.icon, color: style.foregroundColor),
                  ),
                  const SizedBox(width: AltechSpacing.sm),
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AltechSpacing.md),
              Text(message),
            ],
          ),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
                onAction?.call();
              },
              child: Text(actionText),
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
          backgroundColor: semantic.success.withValues(alpha: 0.15),
          foregroundColor: semantic.success,
          icon: Icons.check_circle_rounded,
        );
      case AlertType.error:
        return _AlertStyle(
          backgroundColor: semantic.error.withValues(alpha: 0.15),
          foregroundColor: semantic.error,
          icon: Icons.error_rounded,
        );
      case AlertType.warning:
        return _AlertStyle(
          backgroundColor: semantic.warning.withValues(alpha: 0.15),
          foregroundColor: semantic.warning,
          icon: Icons.warning_rounded,
        );
      case AlertType.info:
        return _AlertStyle(
          backgroundColor: semantic.info.withValues(alpha: 0.15),
          foregroundColor: semantic.info,
          icon: Icons.info_rounded,
        );
    }
  }
}

class _AlertStyle {
  const _AlertStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;
}
