import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text_input/app_text_input.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text_search_input/app_text_search_input_bloc.dart';

class AppTextSearchInput extends StatelessWidget {
  const AppTextSearchInput({
    super.key,
    required this.hintText,
    required this.runFilterFunction,
    required this.filterTextStream,
    required this.filterTextStreamSinkAdd,
  });

  final Stream<String?> filterTextStream;
  final Function(String?) filterTextStreamSinkAdd;
  final Function() runFilterFunction;
  final String hintText;

  static final _bloc = AppTextSearchInputBloc();

  @override
  Widget build(BuildContext context) {
    return AppTextInput(
      stream: filterTextStream,
      hintText: hintText,
      onChanged: (text) => _bloc.onTextChanged(
        text,
        runFilterFunction,
        filterTextStreamSinkAdd,
      ),
      leftIconAssetPath: AppSvgPath.searchIcon,
      hasBorder: true,
      iconPadding: 2,
    );
  }
}
