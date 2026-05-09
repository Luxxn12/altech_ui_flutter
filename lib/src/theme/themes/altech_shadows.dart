import 'package:flutter/material.dart';

@immutable
class AltechShadowTokens extends ThemeExtension<AltechShadowTokens> {
  const AltechShadowTokens({
    required this.sm,
    required this.md,
    required this.lg,
  });

  const AltechShadowTokens.light()
    : sm = const [
        BoxShadow(
          color: Color(0x120E1A38),
          blurRadius: 12,
          offset: Offset(0, 4),
        ),
      ],
      md = const [
        BoxShadow(
          color: Color(0x140E1A38),
          blurRadius: 24,
          offset: Offset(0, 12),
        ),
      ],
      lg = const [
        BoxShadow(
          color: Color(0x1A0E1A38),
          blurRadius: 36,
          offset: Offset(0, 18),
        ),
      ];

  const AltechShadowTokens.dark()
    : sm = const [
        BoxShadow(
          color: Color(0x55000000),
          blurRadius: 12,
          offset: Offset(0, 4),
        ),
      ],
      md = const [
        BoxShadow(
          color: Color(0x66000000),
          blurRadius: 24,
          offset: Offset(0, 12),
        ),
      ],
      lg = const [
        BoxShadow(
          color: Color(0x80000000),
          blurRadius: 36,
          offset: Offset(0, 18),
        ),
      ];

  final List<BoxShadow> sm;
  final List<BoxShadow> md;
  final List<BoxShadow> lg;

  @override
  AltechShadowTokens copyWith({
    List<BoxShadow>? sm,
    List<BoxShadow>? md,
    List<BoxShadow>? lg,
  }) {
    return AltechShadowTokens(
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
    );
  }

  @override
  AltechShadowTokens lerp(
    covariant ThemeExtension<AltechShadowTokens>? other,
    double t,
  ) {
    if (other is! AltechShadowTokens) {
      return this;
    }

    List<BoxShadow> lerpList(List<BoxShadow> a, List<BoxShadow> b) {
      final count = a.length < b.length ? a.length : b.length;
      return List<BoxShadow>.generate(count, (index) {
        return BoxShadow.lerp(a[index], b[index], t) ?? a[index];
      });
    }

    return AltechShadowTokens(
      sm: lerpList(sm, other.sm),
      md: lerpList(md, other.md),
      lg: lerpList(lg, other.lg),
    );
  }
}
