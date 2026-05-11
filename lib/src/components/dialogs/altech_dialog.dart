import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';
import '../buttons/altech_button.dart';

/// Helper for showing confirmation-style dialogs with customizable actions.
abstract final class AltechDialog {
  /// Shows a modern dialog and returns `true` when confirmed.
  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
    bool destructive = false,
    IconData? icon,
    bool showCloseButton = false,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AltechRadius.xl),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 6),
          actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          titlePadding: EdgeInsets.zero,
          title: Row(
            children: [
              if (icon != null) ...[
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color:
                        (destructive
                                ? Theme.of(context).colorScheme.error
                                : Theme.of(context).colorScheme.primary)
                            .withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    size: 18,
                    color: destructive
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: AltechSpacing.xs),
              ],
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              if (showCloseButton)
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                    onCancel?.call();
                  },
                  icon: const Icon(Icons.close_rounded),
                ),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: AltechSpacing.xs),
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: AltechButton(
                    text: cancelText,
                    variant: ButtonVariant.secondary,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                      onCancel?.call();
                    },
                  ),
                ),
                const SizedBox(width: AltechSpacing.sm),
                Expanded(
                  child: AltechButton(
                    text: confirmText,
                    variant: destructive
                        ? ButtonVariant.destructive
                        : ButtonVariant.primary,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      onConfirm?.call();
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
