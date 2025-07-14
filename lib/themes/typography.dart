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
