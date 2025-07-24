import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

///[TuxTypography] is a class that provides a custom text theme
///using the Saira font from Google Fonts. It defines various text styles
///for different text elements such as display, headline, label, and body text.
class TuxTypography {
  static TextTheme buildTextTheme() => TextTheme(
    displayLarge: GoogleFonts.saira(
      fontSize: 78,
      height: 1.2,
      letterSpacing: 0,
    ),
    displaySmall: GoogleFonts.saira(
      fontSize: 42,
      height: 1.2,
      letterSpacing: 0,
    ),
    headlineLarge: GoogleFonts.saira(
      fontSize: 32,
      height: 1.2,
      letterSpacing: 0,
    ),
    headlineMedium: GoogleFonts.saira(
      fontSize: 28,
      height: 1.2,
      letterSpacing: 0,
    ),
    headlineSmall: GoogleFonts.saira(
      fontSize: 24,
      height: 1.2,
      letterSpacing: 0,
    ),
    labelLarge: GoogleFonts.saira(fontSize: 14, height: 1.5, letterSpacing: 0),
    labelMedium: GoogleFonts.saira(fontSize: 12, height: 1.5, letterSpacing: 0),
    bodyLarge: GoogleFonts.saira(fontSize: 16, height: 1.5, letterSpacing: 0),
    bodyMedium: GoogleFonts.saira(fontSize: 14, letterSpacing: 0),
  );
}

/* [CustomTextTheme] all custom text style define here */
extension TuxTextTheme on TextTheme {
  /* DisplayLarge */
  TextStyle? get displayLarge600 =>
      displayLarge?.copyWith(fontWeight: FontWeight.w600);
  /* DisplayLarge */
  TextStyle? get displayLarge500 =>
      displayLarge?.copyWith(fontWeight: FontWeight.w500);
  /* DisplayLarge */
  TextStyle? get displayLarge400 =>
      displayLarge?.copyWith(fontWeight: FontWeight.w400);
  /* DisplaySmall */
  TextStyle? get displaySmall500 =>
      displaySmall?.copyWith(fontWeight: FontWeight.w500);

  /* DisplaySmall */
  TextStyle? get displaySmall400 =>
      displaySmall?.copyWith(fontWeight: FontWeight.w400);

  /* HeadLineLarge */
  TextStyle? get headlineLarge600 =>
      headlineLarge?.copyWith(fontWeight: FontWeight.w600);
  TextStyle? get headlineLarge500 =>
      headlineLarge?.copyWith(fontWeight: FontWeight.w500);
  TextStyle? get headlineLarge400 =>
      headlineLarge?.copyWith(fontWeight: FontWeight.w400);
  /* HeadLineMedium */
  TextStyle? get headlineMedium600 =>
      headlineMedium?.copyWith(fontWeight: FontWeight.w600);

  TextStyle? get headlineMedium500 =>
      headlineMedium?.copyWith(fontWeight: FontWeight.w500);

  TextStyle? get headlineMedium400 =>
      headlineMedium?.copyWith(fontWeight: FontWeight.w400);
  TextStyle? get headlineSmall400 =>
      headlineSmall?.copyWith(fontWeight: FontWeight.w400);
  /* HeadLineSmall */
  TextStyle? get headlineSmall500 =>
      headlineSmall?.copyWith(fontWeight: FontWeight.w500);
  TextStyle? get headlineExtraSmall600 => headlineSmall?.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );
  TextStyle? get headlineExtraSmall500 => headlineSmall?.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );
  TextStyle? get headlineExtraSmall400 => headlineSmall?.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );
  TextStyle? get headlineExtraSmall300 => headlineSmall?.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    height: 1.2,
  );
  /* LabelLarge */
  TextStyle? get labelLarge600 =>
      labelLarge?.copyWith(fontWeight: FontWeight.w600);
  TextStyle? get labelLarge500 =>
      labelLarge?.copyWith(fontWeight: FontWeight.w500);
  TextStyle? get labelLarge400 =>
      labelLarge?.copyWith(fontWeight: FontWeight.w400);
  /* LabelMedium */
  TextStyle? get labelMedium600 =>
      labelMedium?.copyWith(fontWeight: FontWeight.w600);
  TextStyle? get labelMedium500 =>
      labelMedium?.copyWith(fontWeight: FontWeight.w500);
  TextStyle? get labelMedium400 =>
      labelMedium?.copyWith(fontWeight: FontWeight.w400);
  /* Bodylarge */
  TextStyle? get bodyLarge600 =>
      bodyLarge?.copyWith(fontWeight: FontWeight.w600);
  TextStyle? get bodyLarge500 =>
      bodyLarge?.copyWith(fontWeight: FontWeight.w500);
  TextStyle? get bodyLarge400 =>
      bodyLarge?.copyWith(fontWeight: FontWeight.w400);
  /* BodyMedium */
  TextStyle? get bodyMedium600 =>
      bodyMedium?.copyWith(fontWeight: FontWeight.w600);
  TextStyle? get bodyMedium500 =>
      bodyMedium?.copyWith(fontWeight: FontWeight.w500);
  TextStyle? get bodyMedium400 =>
      bodyMedium?.copyWith(fontWeight: FontWeight.w400);

  /* ButtonLabel */
  TextStyle? get buttonLabel => labelLarge?.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );
}
