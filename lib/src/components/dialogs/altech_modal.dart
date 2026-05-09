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
    bool showClose = true,
    double maxWidth = 560,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        final content = Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AltechRadius.xl),
          ),
          insetPadding: const EdgeInsets.all(AltechSpacing.lg),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Padding(
              padding: const EdgeInsets.all(AltechSpacing.md),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null || showClose)
                    Row(
                      children: [
                        if (title != null)
                          Expanded(
                            child: Text(
                              title,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          )
                        else
                          const Spacer(),
                        if (showClose)
                          IconButton(
                            visualDensity: VisualDensity.compact,
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.close_rounded),
                          ),
                      ],
                    ),
                  if (title != null || showClose)
                    const SizedBox(height: AltechSpacing.xs),
                  child,
                ],
              ),
            ),
          ),
        );

        return useSafeArea ? SafeArea(child: content) : content;
      },
    );
  }
}
