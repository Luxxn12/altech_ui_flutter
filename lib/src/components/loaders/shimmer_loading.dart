import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';

class AltechShimmer extends StatefulWidget {
  const AltechShimmer({
    super.key,
    this.width,
    this.height = 16,
    this.radius = AltechRadius.xs,
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
    final base = Theme.of(context).colorScheme.surfaceContainerHighest;
    final highlight = Theme.of(context).colorScheme.surfaceContainer;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            gradient: LinearGradient(
              begin: Alignment(-1 + (_controller.value * 2), -1),
              end: Alignment(1 + (_controller.value * 2), 1),
              colors: [base, highlight, base],
            ),
          ),
        );
      },
    );
  }
}
