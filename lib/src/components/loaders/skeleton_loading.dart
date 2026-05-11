import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';

/// Simple skeleton placeholder block.
class AltechSkeleton extends StatelessWidget {
  /// Creates a static skeleton block.
  const AltechSkeleton({
    super.key,
    this.width,
    this.height = 16,
    this.radius = AltechRadius.sm,
  });

  final double? width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.dark
        ? Theme.of(context).colorScheme.surfaceContainerHigh
        : const Color(0xFFE8EDF5);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
