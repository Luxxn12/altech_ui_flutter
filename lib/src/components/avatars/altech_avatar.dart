import 'package:flutter/material.dart';

class AltechAvatar extends StatelessWidget {
  const AltechAvatar({
    super.key,
    this.image,
    this.initials,
    this.size = 40,
    this.backgroundColor,
    this.foregroundColor,
  });

  final ImageProvider<Object>? image;
  final String? initials;
  final double size;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CircleAvatar(
      radius: size / 2,
      backgroundColor: backgroundColor ?? theme.colorScheme.primaryContainer,
      foregroundColor: foregroundColor ?? theme.colorScheme.onPrimaryContainer,
      backgroundImage: image,
      child: image == null
          ? Text(
              initials?.trim().isNotEmpty == true
                  ? initials!.trim().substring(0, 1).toUpperCase()
                  : '?',
            )
          : null,
    );
  }
}
