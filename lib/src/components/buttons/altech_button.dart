import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';

/// Button style variants used by [AltechButton].
enum ButtonVariant { primary, secondary, tonal, outline, text, destructive }

/// Reusable Material 3 button with multiple visual variants.
class AltechButton extends StatelessWidget {
  /// Creates an Altech button.
  const AltechButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.leading,
    this.trailing,
    this.isLoading = false,
    this.isExpanded = true,
    this.padding,
  });

  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;
  final bool isExpanded;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final child = _buildContent(context);
    final effectiveOnPressed = isLoading ? null : onPressed;
    final style = _style(context);

    final button = switch (variant) {
      ButtonVariant.primary => FilledButton(
        onPressed: effectiveOnPressed,
        style: style,
        child: child,
      ),
      ButtonVariant.secondary => FilledButton(
        onPressed: effectiveOnPressed,
        style: style,
        child: child,
      ),
      ButtonVariant.tonal => FilledButton.tonal(
        onPressed: effectiveOnPressed,
        style: style,
        child: child,
      ),
      ButtonVariant.outline => OutlinedButton(
        onPressed: effectiveOnPressed,
        style: style,
        child: child,
      ),
      ButtonVariant.text => TextButton(
        onPressed: effectiveOnPressed,
        style: style,
        child: child,
      ),
      ButtonVariant.destructive => FilledButton(
        onPressed: effectiveOnPressed,
        style: style,
        child: child,
      ),
    };

    return isExpanded
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }

  ButtonStyle _style(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;

    final (background, foreground, side) = switch (variant) {
      ButtonVariant.primary => (
        color.primary,
        color.onPrimary,
        BorderSide.none,
      ),
      ButtonVariant.secondary => (
        color.surface,
        color.onSurface,
        BorderSide(color: color.outlineVariant),
      ),
      ButtonVariant.tonal => (
        color.secondaryContainer,
        color.onSecondaryContainer,
        BorderSide.none,
      ),
      ButtonVariant.outline => (
        color.surface,
        color.onSurface,
        BorderSide(color: color.outlineVariant),
      ),
      ButtonVariant.text => (
        Colors.transparent,
        color.primary,
        BorderSide.none,
      ),
      ButtonVariant.destructive => (
        color.error,
        color.onError,
        BorderSide.none,
      ),
    };

    final isSurfaceVariant =
        variant == ButtonVariant.secondary || variant == ButtonVariant.outline;

    return ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(0, 44)),
      padding: WidgetStatePropertyAll(
        padding ??
            const EdgeInsets.symmetric(
              horizontal: AltechSpacing.lg,
              vertical: AltechSpacing.sm,
            ),
      ),
      elevation: const WidgetStatePropertyAll(0),
      shadowColor: WidgetStatePropertyAll(
        color.primary.withValues(alpha: 0.22),
      ),
      side: WidgetStatePropertyAll(side),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return color.onSurface.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.pressed)) {
          return isSurfaceVariant
              ? color.surfaceContainerHighest
              : Color.alphaBlend(
                  Colors.black.withValues(alpha: 0.08),
                  background,
                );
        }
        return background;
      }),
      foregroundColor: WidgetStatePropertyAll(foreground),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AltechRadius.sm),
        ),
      ),
      textStyle: WidgetStatePropertyAll(
        theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (isLoading) {
      final spinnerColor = switch (variant) {
        ButtonVariant.primary => Theme.of(context).colorScheme.onPrimary,
        ButtonVariant.destructive => Theme.of(context).colorScheme.onError,
        ButtonVariant.tonal => Theme.of(
          context,
        ).colorScheme.onSecondaryContainer,
        _ => Theme.of(context).colorScheme.primary,
      };

      return SizedBox(
        height: 18,
        width: 18,
        child: CircularProgressIndicator(strokeWidth: 2.2, color: spinnerColor),
      );
    }

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: AltechSpacing.xs),
          ],
          Text(text),
          if (trailing != null) ...[
            const SizedBox(width: AltechSpacing.xs),
            trailing!,
          ],
        ],
      ),
    );
  }
}
