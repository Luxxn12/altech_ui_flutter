import 'package:flutter/material.dart';

/// Raw design tokens for the Altech visual identity.
abstract final class AltechColorTokens {
  static const Color brand = Color(0xFF3F5CFF);
  static const Color brandLight = Color(0xFF6D85FF);
  static const Color brandDark = Color(0xFF2A3FBC);

  static const Color success = Color(0xFF12A150);
  static const Color error = Color(0xFFE11D48);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF2563EB);

  static const Color neutral0 = Color(0xFFFFFFFF);
  static const Color neutral25 = Color(0xFFFBFCFF);
  static const Color neutral50 = Color(0xFFF6F8FD);
  static const Color neutral100 = Color(0xFFEEF2F9);
  static const Color neutral200 = Color(0xFFDDE5F1);
  static const Color neutral300 = Color(0xFFC2CDDD);
  static const Color neutral400 = Color(0xFF94A3B8);
  static const Color neutral600 = Color(0xFF5C6D86);
  static const Color neutral800 = Color(0xFF2E3A50);
  static const Color neutral900 = Color(0xFF151F33);
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
    required this.surfaceSoft,
    required this.border,
  });

  const AltechSemanticColors.light()
    : success = AltechColorTokens.success,
      onSuccess = AltechColorTokens.neutral0,
      error = AltechColorTokens.error,
      onError = AltechColorTokens.neutral0,
      warning = AltechColorTokens.warning,
      onWarning = AltechColorTokens.neutral900,
      info = AltechColorTokens.info,
      onInfo = AltechColorTokens.neutral0,
      surfaceSoft = AltechColorTokens.neutral25,
      border = AltechColorTokens.neutral200;

  const AltechSemanticColors.dark()
    : success = const Color(0xFF4ADE80),
      onSuccess = AltechColorTokens.neutral900,
      error = const Color(0xFFFB7185),
      onError = AltechColorTokens.neutral900,
      warning = const Color(0xFFFBBF24),
      onWarning = AltechColorTokens.neutral900,
      info = const Color(0xFF60A5FA),
      onInfo = AltechColorTokens.neutral900,
      surfaceSoft = const Color(0xFF111B2E),
      border = const Color(0xFF28334B);

  final Color success;
  final Color onSuccess;
  final Color error;
  final Color onError;
  final Color warning;
  final Color onWarning;
  final Color info;
  final Color onInfo;
  final Color surfaceSoft;
  final Color border;

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
    Color? surfaceSoft,
    Color? border,
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
      surfaceSoft: surfaceSoft ?? this.surfaceSoft,
      border: border ?? this.border,
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
      surfaceSoft: Color.lerp(surfaceSoft, other.surfaceSoft, t) ?? surfaceSoft,
      border: Color.lerp(border, other.border, t) ?? border,
    );
  }
}
