import 'package:flutter/material.dart';

class AltechTextField extends StatelessWidget {
  const AltechTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.leading,
    this.trailing,
    this.leadingIcon,
    this.trailingIcon,
    this.iconSize = 20,
    this.leadingIconColor,
    this.trailingIconColor,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.enabled = true,
    this.maxLines = 1,
    this.contentPadding,
    this.fillColor,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.autofocus = false,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final Widget? prefix;
  final Widget? suffix;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final Widget? leading;
  final Widget? trailing;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double iconSize;
  final Color? leadingIconColor;
  final Color? trailingIconColor;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final int maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final bool autofocus;

  Widget? _buildLeading(BuildContext context) {
    final candidate =
        leading ??
        prefix ??
        (leadingIcon != null
            ? Icon(
                leadingIcon,
                size: iconSize,
                color:
                    leadingIconColor ??
                    Theme.of(context).colorScheme.onSurfaceVariant,
              )
            : (prefixIcon == null
                  ? null
                  : Icon(
                      prefixIcon,
                      size: iconSize,
                      color:
                          leadingIconColor ??
                          Theme.of(context).colorScheme.onSurfaceVariant,
                    )));

    if (candidate == null) {
      return null;
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 10, end: 8),
      child: candidate,
    );
  }

  Widget? _buildTrailing(BuildContext context) {
    final candidate =
        trailing ??
        suffix ??
        (trailingIcon != null
            ? Icon(
                trailingIcon,
                size: iconSize,
                color:
                    trailingIconColor ??
                    Theme.of(context).colorScheme.onSurfaceVariant,
              )
            : suffixIcon);

    if (candidate == null) {
      return null;
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8, end: 10),
      child: candidate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      enabled: enabled,
      maxLines: maxLines,
      autofocus: autofocus,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        errorText: errorText,
        contentPadding: contentPadding,
        fillColor: fillColor,
        prefixIcon: _buildLeading(context),
        suffixIcon: _buildTrailing(context),
        prefixIconConstraints:
            prefixIconConstraints ??
            const BoxConstraints(minWidth: 40, minHeight: 20),
        suffixIconConstraints:
            suffixIconConstraints ??
            const BoxConstraints(minWidth: 40, minHeight: 20),
      ),
    );
  }
}
