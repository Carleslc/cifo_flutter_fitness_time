import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'screens/home_screen.dart';
import 'styles/app_styles.dart';

void main() {
  // Es localitza DateFormat abans de carregar l'app,
  // sino dóna error al formatejar les dates de la pantalla inicial
  initializeDateFormatting().then((_) {
    runApp(const FitnessTimeApp());
  });
}

class FitnessTimeApp extends StatelessWidget {
  static const String title = 'Fitness Time';

  const FitnessTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: AppStyles.theme(context),
      home: const HomeScreen(),
    );
  }
}
