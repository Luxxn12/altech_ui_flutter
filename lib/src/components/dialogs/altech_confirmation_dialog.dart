import 'package:flutter/material.dart';

import 'altech_dialog.dart';

/// Convenience wrapper around [AltechDialog] for yes/no confirmations.
abstract final class AltechConfirmationDialog {
  /// Shows a confirmation dialog.
  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = 'Yes',
    String cancelText = 'No',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool destructive = false,
    bool showCloseButton = false,
  }) {
    return AltechDialog.show(
      context,
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      onConfirm: onConfirm,
      onCancel: onCancel,
      destructive: destructive,
      icon: destructive
          ? Icons.warning_amber_rounded
          : Icons.help_outline_rounded,
      showCloseButton: showCloseButton,
    );
  }
}
