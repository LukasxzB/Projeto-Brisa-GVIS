import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    super.key,
    required this.isSelected,
    this.toggleSelected,
    this.activeColor = AppColor.primaryGreen,
    this.disabledColor = AppColor.graySlate,
    this.checkColor = AppColor.whitePure,
  });

  final bool isSelected;
  final void Function()? toggleSelected;
  final Color activeColor, disabledColor, checkColor;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.2,
      child: Checkbox(
        value: isSelected,
        onChanged: (v) => toggleSelected?.call(),
        activeColor: AppColor.primaryGreen,
        checkColor: checkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
