import 'package:flutter/material.dart';

import '../../theme/spacing/altech_radius.dart';
import '../../theme/spacing/altech_spacing.dart';
import '../buttons/altech_button.dart';
import '../inputs/altech_text_field.dart';

/// Top search/action bar commonly used in dashboard headers.
class AltechTopSearchBar extends StatelessWidget {
  /// Creates a top search bar.
  const AltechTopSearchBar({
    super.key,
    this.hintText = 'Search everywhere...',
    this.searchIcon = Icons.search_rounded,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.onPrimaryAction,
    this.onNotificationTap,
    this.primaryActionText = 'New',
    this.showNotification = true,
    this.showShortcutKey = false,
  });

  final String hintText;
  final IconData searchIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onPrimaryAction;
  final VoidCallback? onNotificationTap;
  final String primaryActionText;
  final bool showNotification;
  final bool showShortcutKey;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 560;

        return Container(
          padding: const EdgeInsets.all(AltechSpacing.xs),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.74),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: AltechTextField(
                  controller: controller,
                  focusNode: focusNode,
                  onChanged: onChanged,
                  onSubmitted: onSubmitted,
                  hintText: hintText,
                  fillColor: colorScheme.surfaceContainerLowest,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  leadingIcon: searchIcon,
                  iconSize: 18,
                  trailingIcon: showShortcutKey && !compact
                      ? Icons.keyboard_command_key_rounded
                      : null,
                ),
              ),
              if (showNotification) ...[
                const SizedBox(width: AltechSpacing.xs),
                InkWell(
                  borderRadius: BorderRadius.circular(AltechRadius.pill),
                  onTap: onNotificationTap,
                  child: Ink(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.outlineVariant.withValues(
                          alpha: 0.8,
                        ),
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.notifications_none_rounded,
                          size: 20,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const Positioned(
                          top: 10,
                          right: 10,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Color(0xFF4D71FF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              const SizedBox(width: AltechSpacing.xs),
              SizedBox(
                width: compact ? 46 : 162,
                child: AltechButton(
                  text: compact ? '+' : '+ $primaryActionText',
                  variant: ButtonVariant.primary,
                  onPressed: onPrimaryAction,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
