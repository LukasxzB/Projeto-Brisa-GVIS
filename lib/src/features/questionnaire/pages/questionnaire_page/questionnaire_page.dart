import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/features/questionnaire/local_widgets/chapter_listing/questionnaire_chapter_listing.dart';
import 'package:gvis_mobilidade/src/features/questionnaire/pages/questionnaire_page/questionnaire_page_bloc.dart';
import 'package:gvis_mobilidade/src/shared_widgets/loading/AppLoading.dart';
import 'package:gvis_mobilidade/src/shared_widgets/page/app_base_page.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';
import 'package:gvis_mobilidade/src/shared_widgets/titlebar/app_titlebar.dart';

///
/// [QuestionnairePage] é uma página do aplicativo que as informações de um questionário
/// específico.
///
/// O [questionnaireId] é o identificador do questionário que será carregado
/// através do banco de dados local do aplicativo.
///
/// Este widget exibe a lista de capítulos do questionário através do
/// [QuestionnaireChapterListing].
///
class QuestionnairePage extends StatelessWidget {
  const QuestionnairePage({super.key, required this.questionnaireId});

  static final String unknown = AppString.noInformation;
  static final _bloc = QuestionnairePageBloc();
  final int questionnaireId;

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Column(
        children: <Widget>[
          AppTitlebar(title: AppString.questionnaire),
          Expanded(
            child: FutureBuilder<bool?>(
              future: _bloc.loadQuestionnaireFromId(questionnaireId),
              initialData: null,
              builder: (ctx, snp) {
                return StreamBuilder<bool>(
                  stream: _bloc.isLoadingStream,
                  initialData: true,
                  builder: (isLoadingCtx, isLoadingSnp) {
                    bool isLoading = isLoadingSnp.data ?? true;

                    return StreamBuilder<bool>(
                      stream: _bloc.isErrorStream,
                      initialData: false,
                      builder: (isErrorCtx, isErrorSnp) {
                        bool isError = isErrorSnp.data ?? false;

                        if (isLoading) {
                          return Center(
                            child: AppLoading(
                                text: AppString.loadingQuestionnaire),
                          );
                        }

                        if (isError) {
                          return Center(
                            child: AppText(
                              text: AppString.loadingQuestionnaireFailed,
                              textStyle: AppTextStyle.regular14(),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }

                        return QuestionnaireChapterListing(
                          questionnaireStream: _bloc.questionnaireStream,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
