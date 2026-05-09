import 'dart:async';

import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';
import '../alerts/alert_type.dart';

abstract final class AltechToast {
  static OverlayEntry? _entry;

  static void show(
    BuildContext context, {
    required String message,
    AlertType type = AlertType.info,
    Duration duration = const Duration(seconds: 2),
    Alignment alignment = const Alignment(0, 0.82),
  }) {
    hide();

    final foreground = switch (type) {
      AlertType.success => const Color(0xFF4ADE80),
      AlertType.error => const Color(0xFFFB7185),
      AlertType.warning => const Color(0xFFFBBF24),
      AlertType.info => const Color(0xFF60A5FA),
    };

    final icon = switch (type) {
      AlertType.success => Icons.check_rounded,
      AlertType.error => Icons.close_rounded,
      AlertType.warning => Icons.warning_rounded,
      AlertType.info => Icons.info_rounded,
    };

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
                  color: const Color(0xFF11151F),
                  borderRadius: BorderRadius.circular(AltechRadius.pill),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, size: 16, color: foreground),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        message,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
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
