import 'package:flutter/material.dart';

class AltechAvatar extends StatelessWidget {
  const AltechAvatar({
    super.key,
    this.image,
    this.initials,
    this.size = 40,
    this.backgroundColor,
    this.foregroundColor,
    this.showBorder = true,
    this.statusColor,
  });

  final ImageProvider<Object>? image;
  final String? initials;
  final double size;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool showBorder;
  final Color? statusColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final avatar = CircleAvatar(
      radius: (size - 4) / 2,
      backgroundColor: backgroundColor ?? theme.colorScheme.primaryContainer,
      foregroundColor: foregroundColor ?? theme.colorScheme.onPrimaryContainer,
      backgroundImage: image,
      child: image == null
          ? Text(
              initials?.trim().isNotEmpty == true
                  ? initials!.trim().substring(0, 2).toUpperCase()
                  : '?',
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            )
          : null,
    );

    final wrapped = !showBorder
        ? SizedBox.square(dimension: size, child: avatar)
        : Container(
            width: size,
            height: size,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              shape: BoxShape.circle,
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: avatar,
          );

    if (statusColor == null) {
      return wrapped;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        wrapped,
        Positioned(
          right: showBorder ? 1 : -1,
          bottom: showBorder ? 1 : -1,
          child: Container(
            width: size * 0.26,
            height: size * 0.26,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
              border: Border.all(color: theme.colorScheme.surface, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
