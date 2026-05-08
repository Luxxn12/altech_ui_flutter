import 'package:flutter/material.dart';

import '../colors/altech_color_tokens.dart';
import '../spacing/altech_radius.dart';
import '../spacing/altech_spacing.dart';
import '../typography/altech_typography.dart';
import 'altech_shadows.dart';

abstract final class AltechTheme {
  static ThemeData light({
    Color seedColor = AltechColorTokens.brand,
    String? fontFamily,
  }) {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
      textTheme: AltechTypography.textTheme(fontFamily),
      scaffoldBackgroundColor: AltechColorTokens.neutral50,
      extensions: const [
        AltechSemanticColors.light(),
        AltechShadowTokens.light(),
      ],
    );

    return _decorate(base);
  }

  static ThemeData dark({
    Color seedColor = AltechColorTokens.brand,
    String? fontFamily,
  }) {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.dark,
      ),
      textTheme: AltechTypography.textTheme(fontFamily),
      extensions: const [
        AltechSemanticColors.dark(),
        AltechShadowTokens.dark(),
      ],
    );

    return _decorate(base);
  }

  static ThemeData _decorate(ThemeData theme) {
    final colorScheme = theme.colorScheme;

    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        centerTitle: false,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AltechRadius.md),
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AltechSpacing.md,
          vertical: AltechSpacing.sm,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AltechRadius.sm),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AltechRadius.sm),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AltechRadius.sm),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.4),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AltechRadius.sm),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final isSelected = states.contains(WidgetState.selected);
          return theme.textTheme.labelMedium?.copyWith(
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          );
        }),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AltechRadius.sm),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AltechSpacing.lg,
            vertical: AltechSpacing.sm,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AltechRadius.sm),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AltechSpacing.lg,
            vertical: AltechSpacing.sm,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AltechRadius.sm),
          ),
        ),
      ),
    );
  }
}
