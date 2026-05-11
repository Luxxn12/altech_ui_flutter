import 'package:flutter/material.dart';

/// Reusable app bar with optional subtitle and bottom border.
class AltechAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates an app bar component.
  const AltechAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.actions,
    this.leading,
    this.bottom,
    this.centerTitle,
    this.showBottomBorder = true,
  });

  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final bool? centerTitle;
  final bool showBottomBorder;

  @override
  Widget build(BuildContext context) {
    final titleWidget = subtitle == null
        ? Text(title)
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              Text(
                subtitle!,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          );

    final appBar = AppBar(
      title: titleWidget,
      leading: leading,
      actions: actions,
      bottom: bottom,
      centerTitle: centerTitle,
    );

    if (!showBottomBorder) {
      return appBar;
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(
              context,
            ).colorScheme.outlineVariant.withValues(alpha: 0.65),
          ),
        ),
      ),
      child: appBar,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    bottom == null
        ? kToolbarHeight + (subtitle == null ? 0 : 6)
        : kToolbarHeight +
              bottom!.preferredSize.height +
              (subtitle == null ? 0 : 6),
  );
}
