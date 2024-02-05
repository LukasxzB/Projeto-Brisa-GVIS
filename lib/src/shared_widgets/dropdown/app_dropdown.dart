import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/shared_widgets/dropdown/app_dropdown_item.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.onChanged,
    this.currentValue,
    required this.hintText,
    this.disabledHintText,
    this.items,
    this.height = 45,
  });

  final void Function(String?) onChanged;
  final String? currentValue;
  final String hintText;
  final String? disabledHintText;
  final List<AppDropdownItem>? items;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.whitePure,
      ),
      child: Center(child: _buildDropdownButton()),
    );
  }

  DropdownButton<String> _buildDropdownButton() {
    return DropdownButton<String>(
      value: currentValue,
      onChanged: onChanged,
      isExpanded: true,
      underline: const SizedBox(),
      hint: AppText(textStyle: AppTextStyle.regular14(), text: hintText),
      borderRadius: BorderRadius.circular(5),
      items: _getAppDropdownItems(),
    );
  }

  List<DropdownMenuItem<String>>? _getAppDropdownItems() {
    if (items == null || items!.isEmpty) return null;

    return items!
        .map(
          (item) => DropdownMenuItem<String>(
            value: item.value,
            child: AppText(
              textStyle: AppTextStyle.regular14(),
              text: item.text,
            ),
          ),
        )
        .toList();
  }
}
