import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_chapter_dto.dart';
import 'package:gvis_mobilidade/src/features/questionnaire/local_widgets/chapter_listing_item/questionnaire_chapter_listing_item_bloc.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_svg_asset.dart';
import 'package:gvis_mobilidade/src/shared_widgets/container/container_with_border.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

///
/// [QuestionnaireChapterListingItem] é um widget que exibe um item de capítulo
/// de um questionário. O capítulo é exibido através do
/// [QuestionnaireChapterListingItem].
///
/// Ao clicar em um item, o usuário é redirecionado para a página de categorias
/// do capítulo.
///
class QuestionnaireChapterListingItem extends StatelessWidget {
  const QuestionnaireChapterListingItem({
    super.key,
    required this.chapterDTO,
    required this.chapterIndex,
  });

  final QuestionnaireChapterDTO chapterDTO;
  final int chapterIndex;
  static final String unknown = AppString.noInformation;

  static final _bloc = QuestionnaireChapterListingItemBloc();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _bloc.openCategoryPage(context, chapterDTO.categorias ?? []),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: ContainerWithBorder(
          // TODO: trocar a cor de acordo com a quantidade de perguntas respondidas
          borderColor: AppColor.blueDeep,
          containsLeftBorder: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AppText(
                      text: AppString.questionnaireChapter(
                        chapterIndex,
                        chapterDTO.nomeCapitulo ?? unknown,
                      ),
                      textStyle: AppTextStyle.medium14(),
                      allUpperCase: true,
                    ),
                    const SizedBox(height: 5),
                    AppText(
                      // TODO: trocar
                      text: 'PLACEHOLDER TOTAL DE PERGUNTAS',
                      textStyle: AppTextStyle.regular14(),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              const AppSvgAsset(
                appSvgPath: AppSvgPath.goArrowIcon,
                color: AppColor.blueDeep,
                height: 20,
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
