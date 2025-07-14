import 'package:flutter/material.dart';

import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/themes/typography.dart';

/// [Themes] is a utility class that provides theme configurations for the application.
/// It includes methods to build light and dark themes using the Material Design system.
/// The themes are designed to maintain consistency across the app's UI components.
class Themes {
  Themes._();

  static ThemeData buildLightTheme() {
    return ThemeData(
      primaryColor: AppColors.white,
      textTheme: TuxTypography.buildTextTheme(),
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      canvasColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: AppColors.black,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        error: AppColors.red,
        secondary: AppColors.black,
      ),
    );
  }
}
