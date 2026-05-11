import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';

/// Animated shimmer placeholder block.
class AltechShimmer extends StatefulWidget {
  /// Creates a shimmer placeholder.
  const AltechShimmer({
    super.key,
    this.width,
    this.height = 16,
    this.radius = AltechRadius.sm,
    this.duration = const Duration(milliseconds: 1400),
  });

  final double? width;
  final double height;
  final double radius;
  final Duration duration;

  @override
  State<AltechShimmer> createState() => _AltechShimmerState();
}

class _AltechShimmerState extends State<AltechShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).brightness == Brightness.dark
        ? Theme.of(context).colorScheme.surfaceContainerHigh
        : const Color(0xFFE8EDF5);
    final highlight = Theme.of(context).brightness == Brightness.dark
        ? Theme.of(context).colorScheme.surfaceContainerHighest
        : const Color(0xFFF7FAFF);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            gradient: LinearGradient(
              begin: Alignment(-1.2 + (_controller.value * 2.4), 0),
              end: Alignment(1.2 + (_controller.value * 2.4), 0),
              colors: [base, highlight, base],
              stops: const [0.15, 0.5, 0.85],
            ),
          ),
        );
      },
    );
  }
}
