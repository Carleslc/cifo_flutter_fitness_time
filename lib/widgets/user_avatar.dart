import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

/// Imatge circular que mostra la imatge de l'usuari
class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.imageUrl,
    this.size = 24,
  });

  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: CircleAvatar(
        radius: size,
        backgroundImage: NetworkImage(imageUrl),
        backgroundColor: AppStyles.color.warning, // si no es troba
      ),
    );
  }
}
