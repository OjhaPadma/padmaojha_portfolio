import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      surface: AppColors.surface,
      brightness: Brightness.light,
    );

    final textTheme = GoogleFonts.interTextTheme().copyWith(
      displaySmall: GoogleFonts.sora(
        fontWeight: FontWeight.w700,
        color: AppColors.ink,
        letterSpacing: -0.8,
      ),
      headlineMedium: GoogleFonts.sora(
        fontWeight: FontWeight.w600,
        color: AppColors.ink,
        letterSpacing: -0.4,
      ),
      headlineSmall: GoogleFonts.sora(
        fontWeight: FontWeight.w600,
        color: AppColors.ink,
      ),
      titleLarge: GoogleFonts.sora(
        fontWeight: FontWeight.w600,
        color: AppColors.ink,
      ),
      titleMedium: GoogleFonts.sora(
        fontWeight: FontWeight.w600,
        color: AppColors.ink,
      ),
      bodyLarge: GoogleFonts.inter(color: AppColors.muted, height: 1.55),
      bodyMedium: GoogleFonts.inter(color: AppColors.muted, height: 1.5),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.canvas,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface.withValues(alpha: 0.92),
        foregroundColor: AppColors.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: GoogleFonts.sora(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: AppColors.ink,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.chip,
        labelStyle: GoogleFonts.inter(
          fontSize: 13,
          color: AppColors.primaryDark,
          fontWeight: FontWeight.w500,
        ),
        side: BorderSide.none,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryDark,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          side: const BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
