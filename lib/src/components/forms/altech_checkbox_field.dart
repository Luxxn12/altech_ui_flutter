import 'package:flutter/material.dart';

class AltechCheckboxField extends StatelessWidget {
  const AltechCheckboxField({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.subtitle,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      onChanged: onChanged,
      title: Text(label),
      subtitle: subtitle == null ? null : Text(subtitle!),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }
}
