import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_svg_asset.dart';
import 'package:styled_text/styled_text.dart';

class AppText extends StatelessWidget {
  ///
  /// Texto estilizado com tags:
  /// - <bold>Texto</bold>: transforma o texto em negrito
  /// - <italic>Texto</italic>: transforma o texto em itálico
  /// - <underline>Texto</underline>: sublinha o texto
  ///
  /// Caso um SvgAsset seja passado, o texto será exibido a direita do ícone.
  ///

  const AppText({
    super.key,
    required this.text,
    required this.textStyle,
    this.leftIcon,
    this.textAlign = TextAlign.start,
    this.allLowerCase = false,
    this.allUpperCase = false,
    this.trimText = false,
  });

  final TextStyle textStyle;
  final String text;
  final AppSvgAsset? leftIcon;
  final TextAlign textAlign;
  final bool allUpperCase;
  final bool allLowerCase;
  final bool trimText;

  @override
  Widget build(BuildContext context) {
    if (leftIcon == null) {
      return _buildText();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        leftIcon!,
        const SizedBox(width: 5),
        _buildText(),
      ],
    );
  }

  String _getText() {
    if (allUpperCase) {
      return text.toUpperCase();
    }

    if (allLowerCase) {
      return text.toLowerCase();
    }

    if (trimText) {
      return text.trim();
    }

    return text;
  }

  StyledText _buildText() {
    return StyledText(
      text: _getText(),
      style: textStyle,
      textAlign: textAlign,
      tags: {
        'bold': StyledTextTag(
          style: textStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        'italic': StyledTextTag(
          style: textStyle.copyWith(
            fontStyle: FontStyle.italic,
          ),
        ),
        'underline': StyledTextTag(
          style: textStyle.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
        'BOLD': StyledTextTag(
          style: textStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        'ITALIC': StyledTextTag(
          style: textStyle.copyWith(
            fontStyle: FontStyle.italic,
          ),
        ),
        'UNDERLINE': StyledTextTag(
          style: textStyle.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      },
    );
  }
}
