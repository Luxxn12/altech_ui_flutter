import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';

enum ButtonVariant { primary, secondary, outline, text }

class AltechButton extends StatelessWidget {
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
    final child = _buildContent();
    final effectiveOnPressed = isLoading ? null : onPressed;

    final button = switch (variant) {
      ButtonVariant.primary => FilledButton(
        onPressed: effectiveOnPressed,
        style: _style(context),
        child: child,
      ),
      ButtonVariant.secondary => FilledButton.tonal(
        onPressed: effectiveOnPressed,
        style: _style(context),
        child: child,
      ),
      ButtonVariant.outline => OutlinedButton(
        onPressed: effectiveOnPressed,
        style: _style(context),
        child: child,
      ),
      ButtonVariant.text => TextButton(
        onPressed: effectiveOnPressed,
        style: _style(context),
        child: child,
      ),
    };

    if (!isExpanded) {
      return button;
    }

    return SizedBox(width: double.infinity, child: button);
  }

  ButtonStyle _style(BuildContext context) {
    return ButtonStyle(
      padding: WidgetStatePropertyAll(
        padding ??
            const EdgeInsets.symmetric(
              horizontal: AltechSpacing.lg,
              vertical: AltechSpacing.sm,
            ),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AltechRadius.sm),
        ),
      ),
      textStyle: WidgetStatePropertyAll(Theme.of(context).textTheme.labelLarge),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return const SizedBox(
        height: 18,
        width: 18,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    return Row(
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
    );
  }
}
