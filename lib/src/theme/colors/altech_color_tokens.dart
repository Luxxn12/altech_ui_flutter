import 'package:flutter/material.dart';

/// Raw design tokens for the Altech visual identity.
abstract final class AltechColorTokens {
  static const Color brand = Color(0xFF0D6EFD);
  static const Color brandLight = Color(0xFF6EA8FE);
  static const Color brandDark = Color(0xFF084298);

  static const Color success = Color(0xFF16A34A);
  static const Color error = Color(0xFFDC2626);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF0284C7);

  static const Color neutral0 = Color(0xFFFFFFFF);
  static const Color neutral50 = Color(0xFFF8FAFC);
  static const Color neutral100 = Color(0xFFF1F5F9);
  static const Color neutral200 = Color(0xFFE2E8F0);
  static const Color neutral400 = Color(0xFF94A3B8);
  static const Color neutral600 = Color(0xFF475569);
  static const Color neutral800 = Color(0xFF1E293B);
  static const Color neutral900 = Color(0xFF0F172A);
}

@immutable
class AltechSemanticColors extends ThemeExtension<AltechSemanticColors> {
  const AltechSemanticColors({
    required this.success,
    required this.onSuccess,
    required this.error,
    required this.onError,
    required this.warning,
    required this.onWarning,
    required this.info,
    required this.onInfo,
  });

  const AltechSemanticColors.light()
    : success = AltechColorTokens.success,
      onSuccess = AltechColorTokens.neutral0,
      error = AltechColorTokens.error,
      onError = AltechColorTokens.neutral0,
      warning = AltechColorTokens.warning,
      onWarning = AltechColorTokens.neutral900,
      info = AltechColorTokens.info,
      onInfo = AltechColorTokens.neutral0;

  const AltechSemanticColors.dark()
    : success = const Color(0xFF4ADE80),
      onSuccess = AltechColorTokens.neutral900,
      error = const Color(0xFFF87171),
      onError = AltechColorTokens.neutral900,
      warning = const Color(0xFFFBBF24),
      onWarning = AltechColorTokens.neutral900,
      info = const Color(0xFF38BDF8),
      onInfo = AltechColorTokens.neutral900;

  final Color success;
  final Color onSuccess;
  final Color error;
  final Color onError;
  final Color warning;
  final Color onWarning;
  final Color info;
  final Color onInfo;

  @override
  AltechSemanticColors copyWith({
    Color? success,
    Color? onSuccess,
    Color? error,
    Color? onError,
    Color? warning,
    Color? onWarning,
    Color? info,
    Color? onInfo,
  }) {
    return AltechSemanticColors(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
    );
  }

  @override
  AltechSemanticColors lerp(
    covariant ThemeExtension<AltechSemanticColors>? other,
    double t,
  ) {
    if (other is! AltechSemanticColors) {
      return this;
    }

    return AltechSemanticColors(
      success: Color.lerp(success, other.success, t) ?? success,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t) ?? onSuccess,
      error: Color.lerp(error, other.error, t) ?? error,
      onError: Color.lerp(onError, other.onError, t) ?? onError,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      onWarning: Color.lerp(onWarning, other.onWarning, t) ?? onWarning,
      info: Color.lerp(info, other.info, t) ?? info,
      onInfo: Color.lerp(onInfo, other.onInfo, t) ?? onInfo,
    );
  }
}
