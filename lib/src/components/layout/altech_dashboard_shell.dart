import 'package:flutter/material.dart';

import '../../theme/spacing/altech_spacing.dart';

/// Scrollable dashboard shell with responsive sidebar/main arrangement.
class AltechDashboardShell extends StatelessWidget {
  /// Creates a dashboard shell layout.
  const AltechDashboardShell({
    super.key,
    required this.sidebar,
    required this.main,
    this.maxWidth = 1120,
    this.breakpoint = 920,
    this.gap = AltechSpacing.sm,
    this.padding = const EdgeInsets.fromLTRB(12, 34, 12, 36),
  });

  final Widget sidebar;
  final Widget main;
  final double maxWidth;
  final double breakpoint;
  final double gap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        padding: padding,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final stacked = constraints.maxWidth < breakpoint;

              if (stacked) {
                return Column(
                  children: [
                    sidebar,
                    SizedBox(height: gap),
                    main,
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sidebar,
                  SizedBox(width: gap),
                  Expanded(child: main),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
