import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_dto.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_svg_asset.dart';
import 'package:gvis_mobilidade/src/shared_widgets/container/container_with_border.dart';
import 'package:gvis_mobilidade/src/shared_widgets/page/app_base_page.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';
import 'package:gvis_mobilidade/src/shared_widgets/titlebar/app_titlebar.dart';

class QuestionnaireCategoryPage extends StatelessWidget {
  const QuestionnaireCategoryPage({Key? key, this.questionnaire})
      : super(key: key);

  final QuestionnaireDTO? questionnaire;

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AppTitlebar(
            title: AppString.selectAll,
          ),
          Expanded(
            child: ListView(
              children: [
                _buildContent(context),
                _buildContent(context),
                _buildContent(context),
                _buildContent(context),
                _buildContent(context),
                _buildContent(context),
                _buildContent(context),
                _buildContent(context),
                _buildContent(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Placeholder(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: ContainerWithBorder(
          borderColor: AppColor.primaryGreen,
          containsBottomBorder: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppSvgAsset(
                      appSvgPath: AppSvgPath.writeIcon,
                      color: AppColor.primaryGreen,
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTitleText(),
                          const SizedBox(height: 5),
                          _buildDocumentText(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppText _buildTitleText() {
    return AppText(
      text: "ACONDICIONAMENTO E DESTINO DE RESÍDUOS",
      textStyle: AppTextStyle.bold14(
        color: AppColor.black,
      ),
      textAlign: TextAlign.start,
      trimText: true,
      allUpperCase: true,
    );
  }

  AppText _buildDocumentText() {
    return AppText(
      text: "Total de respostas 10 - Repondidas 8",
      textStyle: AppTextStyle.regular14(),
      textAlign: TextAlign.start,
      trimText: true,
    );
  }
}
