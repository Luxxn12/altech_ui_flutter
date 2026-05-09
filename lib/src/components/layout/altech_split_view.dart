import 'package:flutter/material.dart';

class AltechSplitView extends StatelessWidget {
  const AltechSplitView({
    super.key,
    required this.left,
    required this.right,
    this.gap = 12,
    this.breakpoint = 860,
  });

  final Widget left;
  final Widget right;
  final double gap;
  final double breakpoint;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final stacked = constraints.maxWidth < breakpoint;

        if (stacked) {
          return Column(
            children: [
              left,
              SizedBox(height: gap),
              right,
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: left),
            SizedBox(width: gap),
            Expanded(child: right),
          ],
        );
      },
    );
  }
}
