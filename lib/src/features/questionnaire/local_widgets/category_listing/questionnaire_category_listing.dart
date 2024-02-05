import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_category_dto.dart';
import 'package:gvis_mobilidade/src/features/questionnaire/local_widgets/category_listing_item/questionnaire_category_listing_item.dart';

///
/// [QuestionnaireCategoryListing] é um widget que exibe uma lista de categorias
/// de um questionário. As categorias são ordenadas e exibidas através
/// do [QuestionnaireCategoryListingItem].
///
class QuestionnaireCategoryListing extends StatelessWidget {
  const QuestionnaireCategoryListing({
    super.key,
    required this.categories,
  });

  final List<QuestionnaireCategoryDTO> categories;

  @override
  Widget build(BuildContext context) {
    categories.sort((a, b) =>
        (a.ordemCategoria ?? 1000).compareTo(b.ordemCategoria ?? 1000));

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        var category = categories[index];
        return QuestionnaireCategoryListingItem(category: category);
      },
    );
  }
}
