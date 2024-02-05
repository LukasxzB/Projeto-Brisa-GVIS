import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_svg_asset.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text_input/app_text_input_bloc.dart';

class AppTextInput extends StatelessWidget {
  AppTextInput({
    super.key,
    required this.stream,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.minLines,
    this.maxLines = 1,
    this.hintText,
    this.leftIconAssetPath,
    this.iconColor = AppColor.grayMedium,
    this.enableVisibilityToggle = false,
    this.height = 45,
    this.hasBorder = false,
    this.borderColor = AppColor.grayLight,
    this.iconPadding = 8,
  });

  final Stream<String?> stream;
  final void Function(String?)? onChanged;
  final TextInputType keyboardType;
  final int? minLines, maxLines;
  final String? hintText;
  final AppSvgPath? leftIconAssetPath;
  final Color iconColor;
  final bool enableVisibilityToggle;
  final double height;
  final AppTextInputBloc _bloc = AppTextInputBloc();
  final bool hasBorder;
  final Color borderColor;
  final double iconPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.whitePure,
        border: hasBorder
            ? Border.all(color: borderColor, width: 1)
            : Border.all(color: Colors.transparent, width: 0),
      ),
      child: Center(child: _getTextField()),
    );
  }

  StreamBuilder<bool> _getTextField() {
    return StreamBuilder<bool>(
      stream: _bloc.textVisibleStream,
      initialData: enableVisibilityToggle,
      builder: (context, snapshot) {
        bool showText = !enableVisibilityToggle ? true : snapshot.data!;
        return TextField(
          keyboardType: keyboardType,
          obscureText: !showText,
          enableSuggestions: !enableVisibilityToggle,
          autocorrect: !enableVisibilityToggle,
          onChanged: onChanged,
          cursorColor: AppColor.grayMedium,
          minLines: minLines,
          maxLines: maxLines,
          textAlignVertical: TextAlignVertical.center,
          style: AppTextStyle.regular14(),
          decoration: InputDecoration(
            hintText: hintText,
            isCollapsed: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
            prefixIcon: _buildIcon(leftIconAssetPath, iconPadding),
            prefixIconColor: iconColor,
            suffixIcon: _buildPasswordIcon(showText),
            suffixIconColor: iconColor,
          ),
        );
      },
    );
  }

  GestureDetector? _buildPasswordIcon(bool showText) {
    if (!enableVisibilityToggle) return null;

    return GestureDetector(
        onTap: _bloc.toggleTextVisibility,
        child: _buildIcon(
            showText ? AppSvgPath.eyeOpenIcon : AppSvgPath.eyeClosedIcon, 4));
  }

  Padding? _buildIcon(AppSvgPath? appSvgPath, double padding) {
    if (appSvgPath == null) return null;

    return Padding(
      padding: EdgeInsets.all(padding).copyWith(left: 0),
      child: AppSvgAsset(
        appSvgPath: appSvgPath,
        color: iconColor,
        width: 18,
        height: 18,
      ),
    );
  }
}
