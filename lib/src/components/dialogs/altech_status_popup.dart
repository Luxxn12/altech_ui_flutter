import 'package:flutter/material.dart';

import '../alerts/alert_type.dart';
import '../alerts/altech_alert.dart';

abstract final class AltechStatusPopup {
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
