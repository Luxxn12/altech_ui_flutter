import 'package:flutter/material.dart';

class AltechDropdownField<T> extends StatelessWidget {
  const AltechDropdownField({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.validator,
    this.prefixIcon,
    this.enabled = true,
    this.menuMaxHeight,
  });

  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String? hintText;
  final String? labelText;
  final FormFieldValidator<T>? validator;
  final IconData? prefixIcon;
  final bool enabled;
  final double? menuMaxHeight;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      items: items,
      onChanged: enabled ? onChanged : null,
      validator: validator,
      isExpanded: true,
      menuMaxHeight: menuMaxHeight,
      iconSize: 20,
      iconEnabledColor: Theme.of(context).colorScheme.onSurfaceVariant,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      borderRadius: BorderRadius.circular(12),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon, size: 20),
      ),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
