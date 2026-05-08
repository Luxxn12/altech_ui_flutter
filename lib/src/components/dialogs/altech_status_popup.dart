import 'package:flutter/material.dart';

import '../alerts/alert_type.dart';
import '../alerts/altech_alert.dart';

abstract final class AltechStatusPopup {
  static Future<void> success(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return AltechAlert.show(
      context,
      title: title,
      message: message,
      type: AlertType.success,
    );
  }

  static Future<void> error(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return AltechAlert.show(
      context,
      title: title,
      message: message,
      type: AlertType.error,
    );
  }

  static Future<void> warning(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return AltechAlert.show(
      context,
      title: title,
      message: message,
      type: AlertType.warning,
    );
  }
}
