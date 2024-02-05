import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/shared_widgets/button/app_button.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

///
/// [AppDialog] é um dialogo customizado que recebe um [title], [buttonText] e um [child].
/// O [AppDialog] poderá ser customizado com as cores do [titleColor], [buttonTextColor] e [buttonBackgroundColor].
/// O [buttonOnPressed] é opcional, caso não seja passado o botão principal irá fechar o dialog.
/// O atríbuto [isButtonEnabled] definirá se o botão está ativo ou não.
///
class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.title,
    this.titleColor = AppColor.graySlate,
    required this.buttonText,
    this.buttonTextColor = AppColor.whitePure,
    this.buttonBackgroundColor = AppColor.redPink,
    this.buttonOnPressed,
    required this.child,
    this.isButtonEnabled = true,
    this.containsButton = true,
  });

  final String title;
  final Color titleColor;
  final String buttonText;
  final Color buttonTextColor;
  final Color buttonBackgroundColor;
  final void Function()? buttonOnPressed;
  final Widget child;
  final bool isButtonEnabled;
  final bool containsButton;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(isButtonEnabled),
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppText(
                textStyle: AppTextStyle.bold18(color: titleColor),
                text: title,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              child,
              const SizedBox(height: 20),
              _buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    if (containsButton) {
      return AppButton(
        buttonText: buttonText,
        buttonBackgroundColor: buttonBackgroundColor,
        buttonTextStyle: AppTextStyle.regular14(color: buttonTextColor),
        onPressed: isButtonEnabled
            ? buttonOnPressed ?? () => Navigator.pop(context)
            : null,
      );
    }

    return const SizedBox();
  }
}
