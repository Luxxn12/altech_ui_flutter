import 'dart:async';

import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';

abstract final class AltechToast {
  static OverlayEntry? _entry;

  static void show(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 2),
    Alignment alignment = const Alignment(0, 0.82),
  }) {
    hide();

    final overlay = Overlay.of(context, rootOverlay: true);
    _entry = OverlayEntry(
      builder: (_) {
        return IgnorePointer(
          child: Align(
            alignment: alignment,
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: AltechSpacing.lg,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AltechSpacing.md,
                  vertical: AltechSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  borderRadius: BorderRadius.circular(AltechRadius.pill),
                ),
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(_entry!);
    unawaited(Future<void>.delayed(duration, hide));
  }

  static void hide() {
    _entry?.remove();
    _entry = null;
  }
}
