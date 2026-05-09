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
    final scheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      surface: AltechColorTokens.neutral0,
      surfaceContainerLowest: AltechColorTokens.neutral25,
      brightness: Brightness.light,
    );

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: AltechTypography.textTheme(fontFamily),
      scaffoldBackgroundColor: AltechColorTokens.neutral50,
      dividerColor: AltechColorTokens.neutral200,
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
    final scheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
      surface: const Color(0xFF111B2E),
      surfaceContainerLowest: const Color(0xFF0D1526),
    );

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: AltechTypography.textTheme(fontFamily),
      scaffoldBackgroundColor: const Color(0xFF0B1220),
      dividerColor: const Color(0xFF28334B),
      extensions: const [
        AltechSemanticColors.dark(),
        AltechShadowTokens.dark(),
      ],
    );

    return _decorate(base);
  }

  static ThemeData _decorate(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AltechRadius.lg),
          side: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.7),
          ),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      dialogTheme: DialogThemeData(
        elevation: 0,
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AltechRadius.lg),
          side: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.75),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark
            ? colorScheme.surfaceContainerLow.withValues(alpha: 0.65)
            : colorScheme.surface,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AltechRadius.sm),
          borderSide: BorderSide(
            color: colorScheme.error.withValues(alpha: 0.8),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AltechRadius.sm),
          borderSide: BorderSide(color: colorScheme.error, width: 1.4),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 76,
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.primary.withValues(alpha: 0.12),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AltechRadius.pill),
        ),
        surfaceTintColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final isSelected = states.contains(WidgetState.selected);
          return theme.textTheme.labelSmall?.copyWith(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
          );
        }),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF1E2C49),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AltechRadius.md),
        ),
        contentTextStyle: theme.textTheme.bodyMedium?.copyWith(
          color: AltechColorTokens.neutral0,
        ),
      ),
      chipTheme: theme.chipTheme.copyWith(
        backgroundColor: colorScheme.surface,
        side: BorderSide(color: colorScheme.outlineVariant),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AltechRadius.pill),
        ),
        labelStyle: theme.textTheme.labelMedium,
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: BorderSide(color: colorScheme.outline),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant.withValues(alpha: 0.75),
        thickness: 1,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(0, 44),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 0,
          textStyle: theme.textTheme.labelLarge,
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
          minimumSize: const Size(0, 44),
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          side: BorderSide(color: colorScheme.outlineVariant),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AltechRadius.sm),
          ),
          textStyle: theme.textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(
            horizontal: AltechSpacing.lg,
            vertical: AltechSpacing.sm,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(0, 42),
          foregroundColor: colorScheme.primary,
          textStyle: theme.textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AltechRadius.sm),
          ),
        ),
      ),
    );
  }
}
