import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_chapter_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_dto.dart';
import 'package:gvis_mobilidade/src/features/questionnaire/local_widgets/chapter_listing_item/questionnaire_chapter_listing_item.dart';

///
/// [QuestionnaireChapterListing] é um widget que exibe uma lista de capítulos
/// de um questionário. Os capítulos são ordenados e exibidos através
/// do [QuestionnaireChapterListingItem].
///
class QuestionnaireChapterListing extends StatelessWidget {
  const QuestionnaireChapterListing({
    super.key,
    required this.questionnaireStream,
  });

  final Stream<QuestionnaireDTO?> questionnaireStream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuestionnaireDTO?>(
      stream: questionnaireStream,
      initialData: null,
      builder: (ctx, snp) {
        List<QuestionnaireChapterDTO> chapters = snp.data?.capitulos ?? [];
        chapters.sort((a, b) =>
            (a.ordemCapitulo ?? 1000).compareTo(b.ordemCapitulo ?? 1000));
        return ListView.builder(
          itemCount: chapters.length,
          itemBuilder: (context, index) {
            QuestionnaireChapterDTO chapter = chapters[index];
            return QuestionnaireChapterListingItem(
              chapterIndex: index + 1,
              chapterDTO: chapter,
            );
          },
        );
      },
    );
  }
}
