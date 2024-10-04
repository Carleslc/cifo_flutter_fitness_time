import 'package:flutter/material.dart';

import '../models/activity.dart';
import '../styles/app_styles.dart';
import '../utils/date_utils.dart';
import '../utils/number_utils.dart';

///
/// Card d'una activitat a la pantalla principal
///
class ActivityCard extends StatelessWidget {
  /// Activitat esportiva
  final Activity activity;

  /// Icona de l'activitat
  final Icon icon;

  /// Widget del valor de l'activitat
  final Widget? value;

  const ActivityCard({
    super.key,
    required this.activity,
    required this.icon,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            icon,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tipus d'activitat
                    Text(
                      activity.name,
                      style: AppStyles.text.medium,
                    ),
                    // Data i hora de l'activitat
                    Text(
                      activity.date.format(),
                      // Mida més petita si la pantalla no és suficientment ample,
                      // per evitar que es solapi amb el valor de l'activitat
                      style: (MediaQuery.of(context).size.width > 420
                              ? AppStyles.text.normal
                              : AppStyles.text.small)
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
            if (value != null) value!,
          ],
        ),
      ),
    );
  }
}

class RunningActivityCard extends StatelessWidget {
  final RunningActivity activity;

  const RunningActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return ActivityCard(
      activity: activity,
      icon: Icon(
        Icons.run_circle_outlined,
        color: AppStyles.color.secondary,
        size: 48,
      ),
      value: Text(
        activity.distance.format(
          pattern: CustomNumberFormatter.rightPadded3Pattern,
        ),
        style: AppStyles.text.big,
      ),
    );
  }
}
