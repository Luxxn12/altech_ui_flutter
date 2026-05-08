import 'package:flutter/material.dart';

import '../../extensions/build_context_x.dart';
import '../alerts/alert_type.dart';

abstract final class AltechSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    AlertType type = AlertType.info,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    final style = _styleOf(context, type);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration,
          backgroundColor: style.background,
          content: Row(
            children: [
              Icon(style.icon, color: style.foreground),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: style.foreground),
                ),
              ),
            ],
          ),
          action: action,
        ),
      );
  }

  static _SnackStyle _styleOf(BuildContext context, AlertType type) {
    final semantic = context.semanticColors;

    switch (type) {
      case AlertType.success:
        return _SnackStyle(
          background: semantic.success,
          foreground: semantic.onSuccess,
          icon: Icons.check_circle,
        );
      case AlertType.error:
        return _SnackStyle(
          background: semantic.error,
          foreground: semantic.onError,
          icon: Icons.error,
        );
      case AlertType.warning:
        return _SnackStyle(
          background: semantic.warning,
          foreground: semantic.onWarning,
          icon: Icons.warning,
        );
      case AlertType.info:
        return _SnackStyle(
          background: semantic.info,
          foreground: semantic.onInfo,
          icon: Icons.info,
        );
    }
  }
}

class _SnackStyle {
  const _SnackStyle({
    required this.background,
    required this.foreground,
    required this.icon,
  });

  final Color background;
  final Color foreground;
  final IconData icon;
}
