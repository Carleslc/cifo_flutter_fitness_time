part of 'app_styles.dart';

/// Defineix els colors de l'aplicació.
///
/// Exemple d'accés: `AppStyles.color.primary`
///
/// [Paleta de colors](https://coolors.co/f2f8a0-f896d8-bf63f8-3407da-181528)
final class ColorStyles {
  //
  // Paleta de colors
  //

  // ColorScheme: primary
  // AppBar backgroundColor, DrawerHeader decoration
  final Color primary = const Color(0xFFF896D8);

  // ColorScheme: secondary
  // ActivityCard icon color, CardAttribute background color (perfil)
  // Slider thumbColor, activeTrackColor
  final Color secondary = const Color(0xFFBF63F8);

  // ColorScheme: tertiary
  // CircularPercentIndicator progressColor, enllaços ("Més detalls")
  final Color accent = const Color(0xFF3407DA);

  // ColorScheme: inverseSurface (p.e. SnackBar)
  final Color dark = const Color(0xFF181528);

  // Text labels, borders
  final Color gray = Colors.black45;

  final Color warning = const Color(0xFFF2F8A0);

  //
  // Altres colors
  //

  // p.e. Divider, Slider inactiveTrackColor, CircularPercentIndicator backgroundColor
  final Color lightGray = Colors.black12;

  // Accés centralitzat per si es volgués canviar a un altre to de blanc
  final Color white = Colors.white;

  // ColorScheme: surfaceTint (p.e. Card overlay)
  // Alternativa: primary
  final Color overlay = Colors.transparent;

  /// Color dels títols
  // Alternativa: Colors.black54 (més fosc)
  final Color titleTextColor = Colors.black45;

  /// Color dels textos
  // Alternativa: Colors.black87
  final Color textColor; // default onSurface

  /// Color de fons (p.e. Scaffold)
  // ColorScheme: surface
  final Color background; // default surface

  // Color pels missatges d'errors
  final Color errorBackground; // default error
  final Color errorForeground; // default onError

  /// Esquema de colors del tema
  ///
  /// Spec: https://m3.material.io/styles/color/roles
  late final ColorScheme scheme;

  /// Inicialitza el tema de colors
  ColorStyles._(ColorScheme defaultScheme)
      : background = defaultScheme.surface, // 0xFFFEF7FF (light pink)
        textColor = defaultScheme.onSurface, // 0xFF1D1B20 (dark purple)
        errorBackground = defaultScheme.error, // 0xFFB3261E (red)
        errorForeground = defaultScheme.onError // white
  {
    scheme = defaultScheme.copyWith(
      primary: primary, // e.g. AppBar, FloatingActionButton background
      onPrimary: white, // e.g. AppBar, FloatingActionButton foreground
      primaryContainer: primary, // e.g. ElevatedButton background
      onPrimaryContainer: white, // e.g. ElevatedButton foreground
      secondary: secondary, // e.g Slider activeTrackColor
      onSecondary: textColor, // secondary foreground
      secondaryContainer: secondary, // e.g Card filled background
      onSecondaryContainer: dark, // e.g Card filled foreground
      tertiary: accent, // e.g. CircularPercentIndicator progressColor
      onTertiary: white, // tertiary foreground
      surface: background, // e.g. Scaffold background
      onSurface: textColor, // e.g. Text
      onSurfaceVariant: gray, // e.g. Text labels
      surfaceContainer: background, // e.g. BottomNavigationBar background
      surfaceTint: overlay, // e.g. Card overlay
      inverseSurface: dark, // e.g. SnackBar background
      onInverseSurface: white, // e.g. SnackBar foreground
      inversePrimary: warning, // e.g. SnackBar TextButton
      outline: gray, // e.g. TextField border
      outlineVariant: lightGray, // e.g. Divider
      error: errorBackground,
      onError: errorForeground,
    );
  }
}
