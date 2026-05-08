import 'package:flutter/material.dart';

import 'altech_dialog.dart';

abstract final class AltechConfirmationDialog {
  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = 'Yes',
    String cancelText = 'No',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return AltechDialog.show(
      context,
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }
}
