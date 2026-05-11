import 'package:flutter/material.dart';

import '../../utils/altech_dimensions.dart';

/// Responsive switcher between mobile, tablet, and desktop widgets.
class AltechResponsiveLayout extends StatelessWidget {
  /// Creates a responsive layout helper.
  const AltechResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    if (AltechDimensions.isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    }

    if (AltechDimensions.isTablet(context)) {
      return tablet ?? mobile;
    }

    return mobile;
  }
}
