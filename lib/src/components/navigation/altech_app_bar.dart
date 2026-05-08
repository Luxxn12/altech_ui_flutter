import 'package:flutter/material.dart';

class AltechAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AltechAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.bottom,
    this.centerTitle,
  });

  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: leading,
      actions: actions,
      bottom: bottom,
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    bottom == null
        ? kToolbarHeight
        : kToolbarHeight + bottom!.preferredSize.height,
  );
}
