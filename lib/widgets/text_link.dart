import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../styles/app_styles.dart';

const drinkWaterUrl =
    'https://www.trirelay.cat/la-vital-importancia-de-la-hidratacio-en-lesport/';

/// Text amb un enllaç que obre una pàgina web
class TextLink extends StatelessWidget {
  final String text, url;

  const TextLink({super.key, required this.text, required this.url});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: AppStyles.text.normal.copyWith(
          color: AppStyles.color.accent,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.solid,
        ),
        // Obre una pàgina web informativa
        mouseCursor: WidgetStateMouseCursor.clickable,
        recognizer: TapGestureRecognizer()
          ..onTap = () => launchUrl(Uri.parse(url)),
      ),
    );
  }
}
