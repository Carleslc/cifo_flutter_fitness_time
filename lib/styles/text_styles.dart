part of 'app_styles.dart';

/// Defineix els estils dels textos de l'aplicació.
///
/// Exemple d'accés: `AppStyles.text.title`
final class TextStyles {
  /// Font dels textos
  static const font = GoogleFonts.montserrat;
  static const fontTheme = GoogleFonts.montserratTextTheme;
  static final fontFamily = font().fontFamily;

  /// Títols grans
  final title = textStyle(fontSize: 40, color: AppStyles.color.titleTextColor);

  /// Títols mitjans
  final titleMedium = textStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppStyles.color.titleTextColor,
  );

  /// Textos grans (com el valor Distància)
  final big = textStyle(fontSize: 24);

  /// Textos de mida mitjana (com el tipus d'activitat)
  final medium = textStyle(fontSize: 18);

  /// Textos de mida normal
  final normal = textStyle(fontSize: 14);

  /// Textos de mida petita
  final small = textStyle(fontSize: 12);

  /// Títol de la AppBar
  late final TextStyle appBarTitle;

  /// Tema dels textos
  ///
  // Spec: https://m3.material.io/styles/typography/type-scale-tokens
  late final TextTheme theme;

  /// Inicialitza el tema dels textos
  TextStyles._(TextTheme defaultTheme) {
    theme = fontTheme(
      defaultTheme.merge(TextTheme(
        displayLarge: title,
        displayMedium: big,
        displaySmall: medium,
        headlineLarge: titleMedium,
        headlineMedium: big,
        headlineSmall: normal,
        titleLarge: big,
        titleMedium: titleMedium,
        titleSmall: medium,
        bodyLarge: medium,
        bodyMedium: normal,
        bodySmall: small,
        labelLarge: medium,
        labelMedium: normal,
        labelSmall: small,
      )),
    );

    // El disseny pel títol de l'AppBar utilitza la mida del títol per defecte
    // (defaultTheme.titleLarge.fontSize: 22)
    // Com s'ha definit un tema que sobrescriu la mida de titleLarge (24)
    // hem de definir l'estil a partir del tema per defecte i no el personalitzat
    // Com exemple s'utilitza també una variant de la font més fina
    appBarTitle = textStyle(
      color: AppStyles.color.scheme.onPrimary,
      fontWeight: FontWeight.w300,
      applyFontVariant: true, // Montserrat_300 en comptes de Montserrat_regular
    ).withDefaults(defaultTheme.titleLarge);
  }

  /// Crea un TextStyle amb la font de l'aplicació aplicada.\
  /// Si `applyFontVariant` és true llavors s'aplica la font amb la variant
  /// corresponent, si és false només s'aplica la fontFamily genèrica
  static TextStyle textStyle({
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    Color? color,
    // false per defecte ja que el disseny de l'aplicació només
    // aplica el fontFamily i no utilitza les seves variants
    bool applyFontVariant = false,
  }) {
    final textStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: color,
      fontFamily: fontFamily,
    );
    return applyFontVariant ? textStyle.withAppFont : textStyle;
  }
}

extension TextStyleExtensions on TextStyle {
  /// Aplica la font de l'aplicació amb la variant corresponent\
  /// p.e. Montserrat_bold o Montserrat_700
  TextStyle get withAppFont => TextStyles.font(textStyle: this);

  /// Hereda les propietats per defecte
  TextStyle withDefaults(TextStyle? defaults) => defaults?.merge(this) ?? this;
}
