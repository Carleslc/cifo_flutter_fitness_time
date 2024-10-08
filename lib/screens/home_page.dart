import 'package:flutter/material.dart';

import '../models/activity.dart';
import '../models/user.dart';
import '../styles/app_styles.dart';
import '../widgets/activity_card.dart';
import '../widgets/goal_indicator.dart';
import '../widgets/text_link.dart';

/// Pàgina Inici
class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Títol
            Text(
              'Hola ${user.name},',
              style: AppStyles.text.title,
            ),
            // Recordatori
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Recorda beure aigua regularment al llarg del dia '
                'per mantenir el teu cos hidratat i millorar el teu '
                'rendiment físic i mental.',
              ),
            ),
            // Enllaç
            const Align(
              alignment: Alignment.centerRight,
              child: TextLink(text: 'Més detalls', url: drinkWaterUrl),
            ),
            const SizedBox(height: 30),
            // Activitats
            Text(
              'Darreres activitats',
              style: AppStyles.text.titleMedium,
            ),
            const Divider(),
            for (Activity activity in user.latestActivities(3))
              getActivityCard(activity),
            const SizedBox(height: 30),
            // Objectiu
            Center(
              child: GoalProgressIndicator(
                name: 'Objectiu mensual',
                percent: 65 / 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
