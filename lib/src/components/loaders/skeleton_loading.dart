import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';

class AltechSkeleton extends StatelessWidget {
  const AltechSkeleton({
    super.key,
    this.width,
    this.height = 16,
    this.radius = AltechRadius.xs,
  });

  final double? width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
