import 'package:flutter/material.dart';

import '../../utils/altech_dimensions.dart';

class AltechResponsiveLayout extends StatelessWidget {
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
