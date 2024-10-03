import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'color_styles.dart';
part 'text_styles.dart';

/// Estils de l'aplicació
abstract final class AppStyles {
  /// Plantilla de colors
  static final color = _ColorStyles();

  /// Estils de textos
  static final text = _TextStyles();

  /// Tema de l'aplicació
  static ThemeData theme(BuildContext context) {
    final ThemeData defaultTheme = Theme.of(context);

    // Esquema de colors
    final ColorScheme colorScheme = defaultTheme.colorScheme.copyWith(
      primary: color.primary,
      secondary: color.secondary,
      tertiary: color.tertiary,
      surface: color.background, // e.g. Scaffold background color
      inversePrimary: color.accent,
      inverseSurface: color.dark,
      onPrimary: color.textColor,
    );

    // Tema dels textos
    final TextTheme textTheme = _TextStyles.fontTheme(
      defaultTheme.textTheme.copyWith(
        displayLarge: text.title,
        displayMedium: text.big,
        displaySmall: text.medium,
        headlineLarge: text.titleMedium,
        headlineMedium: text.big,
        headlineSmall: text.normal,
        titleLarge: text.big,
        titleMedium: text.titleMedium,
        titleSmall: text.medium,
        bodyLarge: text.medium,
        bodyMedium: text.normal,
        bodySmall: text.small,
        labelLarge: text.medium,
        labelMedium: text.normal,
        labelSmall: text.small,
      ),
    );

    return ThemeData.from(
      useMaterial3: true,
      textTheme: textTheme,
      colorScheme: colorScheme,
    ).copyWith(
      // Altres temes dels widgets de l'aplicació
      appBarTheme: AppBarTheme(
        foregroundColor: color.white,
        backgroundColor: color.primary,
        titleTextStyle: text.applyFont(
          defaultTheme.textTheme.titleLarge?.copyWith(
            color: color.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      sliderTheme: SliderThemeData(
        thumbColor: color.secondary,
        activeTrackColor: color.secondary,
        inactiveTrackColor: color.lightGray,
      ),
      dividerTheme: DividerThemeData(color: color.gray),
    );
  }
}
