import 'package:flutter/material.dart' show DateUtils;
import 'package:intl/intl.dart' show DateFormat;

/// Utilitats pel maneig de dates
abstract final class DateTimeUtils {
  /// DateTime d'avui a les 00:00
  static DateTime today() {
    final DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  /// DateTime d'ahir a les 00:00
  static DateTime yesterday() => today().subtract(const Duration(days: 1));
}

/// Formateig de dates
extension CustomDateTimeFormatter on DateTime {
  static const String localeEN = 'en';
  static const String localeCA = 'ca';

  /// `HH:mm` 18:20
  static DateFormat timeFormat = DateFormat.Hm(localeEN);

  /// `dd MMM yyyy, HH:mm` 15 Sep 2024, 21:45
  static DateFormat dateTimeFormat = DateFormat('dd MMM yyyy, HH:mm', localeEN);

  /// `d MMMM 'del' y` 20 d'abril del 2022
  static DateFormat dateFormatCA = DateFormat("d MMMM 'del' y", localeCA);

  /// Formateig de data i hora
  ///
  /// S'utilitza un format mixte entre castellà i anglès per obtenir el mateix
  /// resultat que al disseny de referència.
  ///
  /// L'ideal és utilitzar només un format amb el locale del dispositiu.
  String format() {
    if (DateUtils.isSameDay(this, DateTimeUtils.today())) {
      return 'Hoy, ${timeFormat.format(this)}';
    } else if (DateUtils.isSameDay(this, DateTimeUtils.yesterday())) {
      return 'Ayer, ${timeFormat.format(this)}';
    }
    return dateTimeFormat.format(this);
  }

  /// Formateig de data
  ///
  /// S'utilitza el format en català per obtenir el mateix
  /// resultat que al disseny de referència.
  ///
  /// L'ideal és utilitzar només un format amb el locale del dispositiu.
  String formatDate() {
    return dateFormatCA.format(this);
  }
}
