import 'dart:ui' show clampDouble;

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../styles/app_styles.dart';

///
/// Indicador circular de progrés de l'objectiu
///
class GoalProgressIndicator extends StatelessWidget {
  /// Nom de l'objectiu
  final String name;

  /// Progrés actual de l'objectiu, p.e. 65 / 100
  final double percent;

  /// Mida de l'indicador
  final double radius;

  const GoalProgressIndicator({
    super.key,
    required this.name,
    required this.percent,
    this.radius = 50,
  });

  /// Percentatge del progrés entre 0 i 100
  double get progress => 100 * clampDouble(percent, 0, 1);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      percent: percent,
      radius: radius,
      lineWidth: 10,
      progressColor: AppStyles.color.accent,
      circularStrokeCap: CircularStrokeCap.round,
      // backgroundColor: AppStyles.color.lightGray, // Alternativa
      center: Text(
        '${progress.round()}%',
        style: AppStyles.text.titleMedium,
      ),
      footer: Padding(
        // Disseny: 0
        // Alternativa: 4, per que el texte quedi millor una mica més separat
        padding: const EdgeInsets.only(top: 0),
        child: Text(name, style: AppStyles.text.normal),
      ),
    );
  }
}
