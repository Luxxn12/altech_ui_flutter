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
          color: Color(0x140F172A),
          blurRadius: 8,
          offset: Offset(0, 2),
        ),
      ],
      md = const [
        BoxShadow(
          color: Color(0x1A0F172A),
          blurRadius: 18,
          offset: Offset(0, 8),
        ),
      ],
      lg = const [
        BoxShadow(
          color: Color(0x220F172A),
          blurRadius: 28,
          offset: Offset(0, 14),
        ),
      ];

  const AltechShadowTokens.dark()
    : sm = const [
        BoxShadow(
          color: Color(0x4D000000),
          blurRadius: 8,
          offset: Offset(0, 2),
        ),
      ],
      md = const [
        BoxShadow(
          color: Color(0x59000000),
          blurRadius: 18,
          offset: Offset(0, 8),
        ),
      ],
      lg = const [
        BoxShadow(
          color: Color(0x73000000),
          blurRadius: 28,
          offset: Offset(0, 14),
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
