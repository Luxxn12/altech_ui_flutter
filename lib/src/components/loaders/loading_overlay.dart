import 'dart:ui';

import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';

/// Widget wrapper that shows a loading layer above [child].
class AltechLoadingOverlay extends StatelessWidget {
  /// Creates a loading overlay wrapper.
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
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.7, sigmaY: 1.7),
              child: ColoredBox(
                color: barrierColor ?? Colors.black.withValues(alpha: 0.26),
                child: Center(
                  child: _panel(
                    context,
                    message: message,
                    indicator: indicator,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// Global imperative loading overlay helper.
abstract final class AltechLoading {
  static OverlayEntry? _entry;

  /// Shows a fullscreen loading overlay.
  static void show(BuildContext context, {String? message}) {
    hide();
    final overlay = Overlay.of(context, rootOverlay: true);
    _entry = OverlayEntry(
      builder: (_) => Material(
        color: Colors.black.withValues(alpha: 0.26),
        child: Center(child: _panel(context, message: message)),
      ),
    );

    overlay.insert(_entry!);
  }

  /// Hides the global loading overlay if visible.
  static void hide() {
    _entry?.remove();
    _entry = null;
  }
}

Widget _panel(BuildContext context, {String? message, Widget? indicator}) {
  return Container(
    constraints: const BoxConstraints(maxWidth: 270),
    padding: const EdgeInsets.symmetric(
      horizontal: AltechSpacing.md,
      vertical: AltechSpacing.md,
    ),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(AltechRadius.lg),
      border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      boxShadow: const [
        BoxShadow(
          color: Color(0x2B0D1730),
          blurRadius: 24,
          offset: Offset(0, 10),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        indicator ??
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.8,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
        if (message != null) ...[
          const SizedBox(height: AltechSpacing.sm),
          Text(message, textAlign: TextAlign.center),
        ],
      ],
    ),
  );
}
