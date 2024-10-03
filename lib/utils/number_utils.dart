import 'package:intl/intl.dart' show NumberFormat;

extension CustomNumberFormatter on num {
  /// Format per defecte amb tres decimals opcionals
  ///
  /// `#,##0.###` 1.234,567
  static final defaultPattern = NumberFormat.decimalPattern('ca');

  /// Format amb tres digits decimals
  ///
  /// `#,##0.000` 1.234,500
  static final rightPadded3Pattern = NumberFormat('#,##0.000', 'ca');

  /// Formateig d'un número
  ///
  /// Per defecte s'utilitza el format [defaultPattern]
  ///
  /// L'ideal és utilitzar un format amb el locale del dispositiu.
  String format([NumberFormat? pattern]) {
    pattern ??= CustomNumberFormatter.defaultPattern;
    return pattern.format(this);
  }
}
