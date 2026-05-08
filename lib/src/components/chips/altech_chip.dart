import 'package:flutter/material.dart';

class AltechChip extends StatelessWidget {
  const AltechChip({
    super.key,
    required this.label,
    this.avatar,
    this.onDeleted,
    this.onTap,
    this.selected = false,
  });

  final String label;
  final Widget? avatar;
  final VoidCallback? onDeleted;
  final VoidCallback? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InputChip(
      label: Text(label),
      avatar: avatar,
      onDeleted: onDeleted,
      onPressed: onTap,
      selected: selected,
      showCheckmark: selected,
    );
  }
}
