import 'package:flutter/material.dart';

import '../models/activity.dart';
import '../models/user.dart';
import '../styles/app_styles.dart';
import '../widgets/goal_indicator.dart';

/// Pàgina Inici
class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Títol
          Text(
            'Hola ${user.name},',
            style: AppStyles.text.title,
          ),
          // Consells
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Recorda beure aigua regularment al llarg del dia '
              'per mantenir el teu cos hidratat i millorar el teu '
              'rendiment físic i mental.',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Més detalls',
                style: TextStyle(
                  color: AppStyles.color.darkAccent,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // Activitats
          Text(
            'Darreres activitats',
            style: AppStyles.text.titleMedium,
          ),
          const Divider(),
          for (Activity activity in user.latestActivities(3))
            activity.toWidget(),
          const SizedBox(height: 40),
          // Objectiu
          const Center(
            child: GoalProgressIndicator(
              name: 'Objectiu mensual',
              percent: 65 / 100,
            ),
          ),
        ],
      ),
    );
  }
}
