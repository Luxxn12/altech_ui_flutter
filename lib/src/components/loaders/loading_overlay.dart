import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';

class AltechLoadingOverlay extends StatelessWidget {
  const AltechLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.message,
    this.barrierColor,
    this.indicator,
  });

  final bool isLoading;
  final Widget child;
  final String? message;
  final Color? barrierColor;
  final Widget? indicator;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: ColoredBox(
              color: barrierColor ?? Colors.black.withValues(alpha: 0.35),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 260),
                  padding: const EdgeInsets.all(AltechSpacing.md),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(AltechRadius.md),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      indicator ?? const CircularProgressIndicator(),
                      if (message != null) ...[
                        const SizedBox(height: AltechSpacing.sm),
                        Text(message!, textAlign: TextAlign.center),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

abstract final class AltechLoading {
  static OverlayEntry? _entry;

  static void show(BuildContext context, {String? message}) {
    hide();
    final overlay = Overlay.of(context, rootOverlay: true);
    _entry = OverlayEntry(
      builder: (_) => Material(
        color: Colors.black.withValues(alpha: 0.35),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(AltechSpacing.md),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(AltechRadius.md),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                if (message != null) ...[
                  const SizedBox(height: AltechSpacing.sm),
                  Text(message),
                ],
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(_entry!);
  }

  static void hide() {
    _entry?.remove();
    _entry = null;
  }
}
