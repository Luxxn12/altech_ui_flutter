import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';

abstract final class AltechModal {
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    String? title,
    bool useSafeArea = true,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        final content = Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AltechRadius.lg),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AltechSpacing.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: AltechSpacing.sm),
                ],
                child,
              ],
            ),
          ),
        );

        if (!useSafeArea) {
          return content;
        }

        return SafeArea(child: content);
      },
    );
  }
}
