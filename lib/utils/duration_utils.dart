extension CustomDurationFormatter on Duration {
  /// Formateig de duració
  ///
  /// S'utilitza el format `Hh m'` per obtenir el mateix
  /// resultat que al disseny de referència.
  ///
  /// L'ideal és utilitzar un format adeqüat al locale del dispositiu,
  /// utilitzant una llibreria com [duration](https://pub.dev/packages/duration)
  String format() {
    final defaultFormat = toString(); // H:MM:SS.mmmmmm

    final [hours, minutes, _] = defaultFormat.split(':');

    return "${hours}h $minutes'";
  }
}
