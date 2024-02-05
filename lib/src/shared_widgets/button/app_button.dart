import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_svg_asset.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    this.buttonBackgroundColor = AppColor.primaryGreen,
    this.disabledButtonBackgroundColor = AppColor.disabledColor,
    this.disabledButtonTextColor = AppColor.whitePure,
    required this.buttonText,
    required this.buttonTextStyle,
    this.buttonHeight = 50,
    this.buttonWidth,
    this.buttonIcon,
    this.expandButtonToInfinity = true,
  });

  final void Function()? onPressed;
  final bool expandButtonToInfinity;
  final Color buttonBackgroundColor, disabledButtonBackgroundColor;
  final Color disabledButtonTextColor;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final double? buttonWidth, buttonHeight;
  final AppSvgAsset? buttonIcon;

  @override
  Widget build(BuildContext context) {
    if (buttonIcon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: buttonIcon!,
        label: _getButtonText(),
        style: _getButtonStyle(),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: _getButtonStyle(),
      child: _getButtonText(),
    );
  }

  AppText _getButtonText() {
    Color color = onPressed == null
        ? disabledButtonTextColor
        : buttonTextStyle.color ?? AppColor.whitePure;

    return AppText(
      textStyle: buttonTextStyle.copyWith(color: color),
      text: buttonText,
    );
  }

  ButtonStyle _getButtonStyle() {
    return ButtonStyle(
      iconColor: MaterialStateProperty.all<Color?>(buttonIcon?.color),
      iconSize: MaterialStateProperty.all<double?>(
        buttonIcon?.height ?? buttonIcon?.width,
      ),
      backgroundColor: _getButtonBackgroundColor(),
      minimumSize: MaterialStateProperty.all<Size>(
        Size(
          buttonWidth ?? (expandButtonToInfinity ? double.infinity : 0),
          buttonHeight ?? 0,
        ),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  MaterialStateProperty<Color> _getButtonBackgroundColor() {
    return MaterialStateProperty.resolveWith<Color>((states) {
      if (states.contains(MaterialState.disabled)) {
        return disabledButtonBackgroundColor;
      }

      return buttonBackgroundColor;
    });
  }
}
