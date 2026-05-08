import 'package:flutter/material.dart';

import '../theme/colors/altech_color_tokens.dart';
import '../theme/themes/altech_shadows.dart';

extension AltechBuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;

  AltechSemanticColors get semanticColors {
    return theme.extension<AltechSemanticColors>() ??
        (theme.brightness == Brightness.dark
            ? const AltechSemanticColors.dark()
            : const AltechSemanticColors.light());
  }

  AltechShadowTokens get shadows {
    return theme.extension<AltechShadowTokens>() ??
        (theme.brightness == Brightness.dark
            ? const AltechShadowTokens.dark()
            : const AltechShadowTokens.light());
  }
}
