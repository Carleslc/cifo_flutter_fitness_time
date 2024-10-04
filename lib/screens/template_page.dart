import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

/// Pàgina plantilla (Cercar, Botiga)
class TemplatePage extends StatelessWidget {
  const TemplatePage({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: AppStyles.color.gray),
          Text('Pròximament', style: AppStyles.text.medium),
        ],
      ),
    );
  }
}
