import 'dart:math';

import 'activity.dart';

class User {
  /// Nom
  final String name;

  /// Cognom
  final String surname;

  /// Altura en centímetres
  final int? height;

  /// Pes en kilograms
  final double? weight;

  /// Imatge de perfil
  final String imageUrl;

  /// Quan es va crear l'usuari
  final DateTime createdAt;

  /// Activitats de l'usuari
  late final List<Activity> activities;

  User({
    required this.name,
    this.surname = '',
    this.height,
    this.weight,
    required this.imageUrl,
    required this.createdAt,
    required List<Activity> activities,
  }) {
    // Ordenades descendentment per data (més recents primer)
    // Activity implementa Comparable<Activity> amb el mètode `compareTo`
    this.activities = activities..sort();
  }

  /// Nom i cognoms
  String get fullName => '$name $surname';

  /// Últimes n activitats
  List<Activity> latestActivities(int n) =>
      activities.sublist(0, min(n, activities.length));
}

final User templateUser = User(
  name: 'Antònia',
  surname: 'Font',
  height: 150,
  weight: 55,
  imageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
  createdAt: DateTime(2022, DateTime.april, 20),
  activities: templateActivities(),
);
