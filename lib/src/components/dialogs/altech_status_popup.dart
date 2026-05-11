import 'package:flutter/material.dart';

import '../alerts/alert_type.dart';
import '../alerts/altech_alert.dart';

/// Preconfigured status popups built on top of [AltechAlert].
abstract final class AltechStatusPopup {
  /// Shows a success popup.
  static Future<void> success(
    BuildContext context, {
    String title = 'Success',
    required String message,
    String actionText = 'Continue',
  }) {
    return AltechAlert.show(
      context,
      title: title,
      message: message,
      type: AlertType.success,
      actionText: actionText,
    );
  }

  /// Shows an error popup.
  static Future<void> error(
    BuildContext context, {
    String title = 'Something went wrong',
    required String message,
    String actionText = 'Try again',
  }) {
    return AltechAlert.show(
      context,
      title: title,
      message: message,
      type: AlertType.error,
      actionText: actionText,
    );
  }

  /// Shows a warning popup.
  static Future<void> warning(
    BuildContext context, {
    String title = 'Please review',
    required String message,
    String actionText = 'Understood',
  }) {
    return AltechAlert.show(
      context,
      title: title,
      message: message,
      type: AlertType.warning,
      actionText: actionText,
    );
  }
}
