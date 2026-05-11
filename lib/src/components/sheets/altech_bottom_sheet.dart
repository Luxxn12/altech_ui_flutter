import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';

/// Helper for showing Material 3 styled bottom sheets.
abstract final class AltechBottomSheet {
  /// Shows a modal bottom sheet.
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    String? title,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = true,
    bool showHandle = true,
    double horizontalPadding = 16,
    double verticalPadding = 16,
    double? maxHeightFactor,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled,
      showDragHandle: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AltechRadius.xl),
        ),
      ),
      builder: (_) {
        final content = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showHandle)
              Center(
                child: Container(
                  width: 48,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(AltechRadius.pill),
                  ),
                ),
              ),
            if (title != null) ...[
              const SizedBox(height: AltechSpacing.md),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
            const SizedBox(height: AltechSpacing.md),
            child,
          ],
        );

        final wrapped = maxHeightFactor == null
            ? content
            : ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight:
                      MediaQuery.sizeOf(context).height * maxHeightFactor,
                ),
                child: SingleChildScrollView(child: content),
              );

        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              10,
              horizontalPadding,
              verticalPadding,
            ),
            child: wrapped,
          ),
        );
      },
    );
  }
}
