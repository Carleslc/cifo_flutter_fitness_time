import 'package:flutter/material.dart';

import '../utils/date_utils.dart';
import '../widgets/activity_card.dart';
import 'distance.dart';

abstract class Activity implements Comparable<Activity> {
  /// Nom de l'activitat
  final String name;

  /// Data de l'activitat
  final DateTime date;

  /// Durada de l'activitat
  final Duration duration;

  Activity({
    required this.name,
    required this.date,
    required this.duration,
  });

  /// Widget que representa l'activitat
  Widget toWidget();

  @override
  int compareTo(Activity other) => -date.compareTo(other.date); // - descendent
}

class RunningActivity extends Activity {
  /// Distància de l'activitat
  final Distance distance;

  RunningActivity({
    required super.date,
    required super.duration,
    required this.distance,
  }) : super(name: 'Running');

  @override
  RunningActivityCard toWidget() {
    return RunningActivityCard(activity: this);
  }
}

List<Activity> templateActivities() {
  final DateTime yesterday = DateTimeUtils.yesterday();

  return [
    // Darreres activitats
    RunningActivity(
      distance: const Distance.km(7.3),
      duration: const Duration(hours: 1, minutes: 15),
      date: DateTime(yesterday.year, yesterday.month, yesterday.day, 18, 20),
    ),
    RunningActivity(
      distance: const Distance.km(6.55),
      duration: const Duration(minutes: 30),
      date: DateTime(2024, DateTime.september, 15, 21, 45),
    ),
    RunningActivity(
      distance: const Distance.km(7.1),
      duration: const Duration(hours: 1),
      date: DateTime(2024, DateTime.september, 10, 21, 33),
    ),

    // Afegeix més activitats plantilla segons el disseny
    for (int i = 3; i < 42 - 1; i++)
      RunningActivity(
        date: DateTime(2023),
        duration: const Duration(),
        distance: const Distance.km(),
      ),

    // Afegeix la distància que falta,
    // per mostrar el mateix valor total que al disseny
    RunningActivity(
      date: DateTime(2023),
      duration: const Duration(),
      distance: const Distance.km(212.4 - (7.3 + 6.55 + 7.1)),
    ),
  ];
}
