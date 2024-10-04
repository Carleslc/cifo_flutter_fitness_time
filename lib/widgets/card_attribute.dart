import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

///
/// Card d'un valor a la pantalla de perfil
/// (Time, Km, Activities)
///
class CardAttribute extends StatelessWidget {
  /// Icona de l'atribut
  final IconData icon;

  /// Nom de l'atribut
  final String name;

  /// Valor de l'atribut
  final String value;

  const CardAttribute({
    super.key,
    required this.icon,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).colorScheme.secondaryContainer;
    Color foregroundColor = Theme.of(context).colorScheme.onSecondaryContainer;

    return Card(
      elevation: 3,
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Icon(icon, color: foregroundColor),
            Text(
              name,
              style: AppStyles.text.normal.copyWith(color: foregroundColor),
            ),
            Text(
              value,
              style: AppStyles.text.medium.copyWith(color: foregroundColor),
            ),
          ],
        ),
      ),
    );
  }
}
