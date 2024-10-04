import 'package:flutter/material.dart';

import '../utils/number_utils.dart';

///
/// Slider d'un valor a la pantalla de perfil
/// (Height, Weight)
///
class SliderAttribute extends StatelessWidget {
  /// Nom de l'atribut
  final String name;

  /// Valor de l'atribut
  final double value;

  /// Unitat de l'atribut
  final String unit;

  /// Valor màxim de l'atribut
  final double max;

  const SliderAttribute({
    super.key,
    required this.name,
    required this.value,
    required this.unit,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(name),
        // evita la interacció i animacions
        AbsorbPointer(
          child: Slider(
            max: max,
            value: value,
            onChanged: (_) {}, // no canvia
          ),
        ),
        Text('${value.format()} $unit'),
      ],
    );
  }
}
