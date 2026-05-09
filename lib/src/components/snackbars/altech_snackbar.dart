import 'package:flutter/material.dart';

import '../../extensions/build_context_x.dart';
import '../../theme/spacing/altech_radius.dart';
import '../alerts/alert_type.dart';

abstract final class AltechSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    String? title,
    AlertType type = AlertType.info,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
    String? actionLabel,
    VoidCallback? onActionPressed,
  }) {
    final style = _styleOf(context, type);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration,
          backgroundColor: const Color(0xFF141821),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AltechRadius.md),
          ),
          content: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: style.foreground.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(style.icon, color: style.foreground, size: 17),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null)
                      Text(
                        title,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    Text(
                      message,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          action:
              action ??
              (actionLabel != null
                  ? SnackBarAction(
                      label: actionLabel,
                      textColor: Colors.white,
                      onPressed: onActionPressed ?? () {},
                    )
                  : null),
        ),
      );
  }

  static _SnackStyle _styleOf(BuildContext context, AlertType type) {
    final semantic = context.semanticColors;

    switch (type) {
      case AlertType.success:
        return _SnackStyle(
          foreground: semantic.success,
          icon: Icons.check_rounded,
        );
      case AlertType.error:
        return _SnackStyle(
          foreground: semantic.error,
          icon: Icons.close_rounded,
        );
      case AlertType.warning:
        return _SnackStyle(
          foreground: semantic.warning,
          icon: Icons.warning_rounded,
        );
      case AlertType.info:
        return _SnackStyle(foreground: semantic.info, icon: Icons.info_rounded);
    }
  }
}

class _SnackStyle {
  const _SnackStyle({required this.foreground, required this.icon});

  final Color foreground;
  final IconData icon;
}
