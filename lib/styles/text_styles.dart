part of 'app_styles.dart';

/// Defineix els estils dels textos de l'aplicació.
///
/// Exemple d'accés: `AppStyles.text.title`
final class _TextStyles {
  /// Títols grans
  final TextStyle title = textStyle(fontSize: 40);

  /// Títols mitjans
  final TextStyle titleMedium =
      textStyle(fontSize: 24, fontWeight: FontWeight.w500);

  /// Textos grans (com el valor Distància)
  final TextStyle big = textStyle(fontSize: 24);

  /// Textos de mida mitjana (com el tipus d'activitat)
  final TextStyle medium = textStyle(fontSize: 18);

  /// Textos de mida normal
  final TextStyle normal = textStyle(fontSize: 14);

  /// Textos de mida petita
  final TextStyle small = textStyle(fontSize: 12);

  /// Font dels textos
  static TextStyle Function({TextStyle? textStyle}) font =
      GoogleFonts.montserrat;

  /// Aplica la font de l'aplicació a un tema
  static TextTheme Function(TextTheme?) fontTheme =
      GoogleFonts.montserratTextTheme;

  /// Aplica la font de l'aplicació a un TextStyle
  TextStyle applyFont([TextStyle? textStyle]) => font(textStyle: textStyle);

  static TextStyle textStyle({
    required double fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    Color? color,
  }) {
    color ??= AppStyles.color.textColor;

    return font(
      textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
      ),
    );
  }
}
