import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

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
    return Card(
      elevation: 3,
      color: AppStyles.color.secondary,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Icon(icon),
            Text(name),
            Text(value, style: AppStyles.text.medium),
          ],
        ),
      ),
    );
  }
}
