import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../models/activity.dart';
import '../models/distance.dart';
import '../models/user.dart';
import '../styles/app_styles.dart';
import '../utils/date_utils.dart';
import '../utils/duration_utils.dart';
import '../utils/number_utils.dart';
import '../widgets/card_attribute.dart';
import '../widgets/slider_attribute.dart';
import '../widgets/user_avatar.dart';

/// Pantalla del perfil d'usuari
class ProfileScreen extends StatelessWidget {
  static const String title = 'Perfil';

  final User user;

  const ProfileScreen({super.key, required this.user});

  // Disseny: 2h 45'
  Duration get totalDuration => Duration(
      minutes: user.activities
          .map<int>((activity) => activity.duration.inMinutes)
          .sum); // el mètode sum és de la llibreria collection

  // Disseny: 212,4
  Distance get totalDistance => Distance.km(user.activities
      .whereType<RunningActivity>()
      .map<double>((activity) => activity.distance.kilometers)
      .sum);

  // Disseny: 42
  int get totalActivities => user.activities.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imatge de perfil
            Padding(
              padding: const EdgeInsets.all(16),
              child: IconButton(
                icon: UserAvatar(imageUrl: user.imageUrl, size: 110),
                onPressed: () => Navigator.of(context).pop(), // Torna enrere
              ),
            ),
            // Capçalera
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Text(
                    user.fullName,
                    style: AppStyles.text.title,
                  ),
                  Text(
                    'des del ${user.createdAt.formatDate()}',
                    style: AppStyles.text.small,
                  ),
                ],
              ),
            ),
            // Estadístiques
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CardAttribute(
                    icon: Icons.alarm,
                    name: 'Time',
                    value: totalDuration.format(),
                  ),
                  CardAttribute(
                    icon: Icons.location_pin,
                    name: 'Km',
                    value: totalDistance.format(withSuffix: false),
                  ),
                  CardAttribute(
                    icon: Icons.home,
                    name: 'Activities',
                    value: totalActivities.format(),
                  ),
                ],
              ),
            ),
            // Sliders
            Column(
              children: [
                // Altura
                if (user.height != null)
                  SliderAttribute(
                    name: 'Height',
                    value: user.height!.toDouble(),
                    unit: 'cm',
                    max: 400,
                  ),
                // Pes
                if (user.weight != null)
                  SliderAttribute(
                    name: 'Weight',
                    value: user.weight!.toDouble(),
                    unit: 'kg',
                    max: 200,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
