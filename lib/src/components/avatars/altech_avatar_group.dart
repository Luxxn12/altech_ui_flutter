import 'package:flutter/material.dart';

import '../../theme/spacing/altech_spacing.dart';
import 'altech_avatar.dart';

class AltechAvatarGroup extends StatelessWidget {
  const AltechAvatarGroup({
    super.key,
    required this.initials,
    this.maxVisible = 2,
    this.size = 34,
  });

  final List<String> initials;
  final int maxVisible;
  final double size;

  @override
  Widget build(BuildContext context) {
    final visible = initials.take(maxVisible).toList(growable: false);
    final remaining = initials.length - visible.length;
    final overlap = size * 0.28;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: visible.isEmpty
              ? 0
              : (size * visible.length) - (overlap * (visible.length - 1)),
          height: size,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              for (var i = 0; i < visible.length; i++)
                Positioned(
                  left: i * (size - overlap),
                  child: AltechAvatar(initials: visible[i], size: size),
                ),
            ],
          ),
        ),
        if (remaining > 0)
          Container(
            margin: const EdgeInsets.only(left: AltechSpacing.xs),
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '+$remaining',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
      ],
    );
  }
}
