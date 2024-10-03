import 'package:intl/intl.dart' show NumberFormat;

import '../utils/number_utils.dart';

/// Representa una distància en una unitat determinada (m, km)
class Distance {
  /// El valor de la distància
  final double distance;

  /// La unitat de la distància
  final DistanceUnit unit;

  const Distance({required this.distance, required this.unit});

  /// Distància en metres
  const Distance.m([double meters = 0])
      : this(distance: meters, unit: DistanceUnit.meters);

  /// Distància en kilòmetres
  const Distance.km([double kilometers = 0])
      : this(distance: kilometers, unit: DistanceUnit.kilometers);

  /// Formateig de la distància
  ///
  /// Per defecte s'utilitza el format [CustomNumberFormatter.defaultPattern]
  ///
  /// L'ideal és utilitzar un format amb el locale del dispositiu.
  String format({NumberFormat? pattern, bool withSuffix = true}) {
    final formatted = distance.format(pattern);
    return withSuffix ? '$formatted ${unit.suffix}' : formatted;
  }

  /// Converteix la distància a metres
  double get meters {
    switch (unit) {
      case DistanceUnit.meters:
        return distance;
      case DistanceUnit.kilometers:
        return distance * 1000;
    }
  }

  /// Converteix la distància a kilòmetres
  double get kilometers {
    switch (unit) {
      case DistanceUnit.meters:
        return distance / 1000;
      case DistanceUnit.kilometers:
        return distance;
    }
  }
}

/// Unitat de distància
enum DistanceUnit {
  meters('m'),
  kilometers('km');

  final String suffix;

  const DistanceUnit(this.suffix);
}
