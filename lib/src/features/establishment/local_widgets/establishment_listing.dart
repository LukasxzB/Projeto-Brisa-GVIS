import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_dto/establishment/establishment_dto.dart';
import 'package:gvis_mobilidade/src/features/establishment/local_widgets/establishment_listing_item.dart';
import 'package:gvis_mobilidade/src/shared_widgets/empty_listing_warning/empty_listing_warning.dart';

///
/// [EstablishmentListing] é um widget que recebe uma lista de estabelecimentos
/// e gera um ListView com os mesmos.
/// Este widget não mostra se a lista está sendo carregada, isso é responsabilidade do
/// widget pai do mesmo (o widget que utiliza esta listagem).
///
class EstablishmentListing extends StatelessWidget {
  const EstablishmentListing({
    super.key,
    required this.establishments,
  });

  final List<EstablishmentDTO> establishments;

  @override
  Widget build(BuildContext context) {
    if (establishments.isEmpty) {
      return EmptyListingWarning(
        text: AppString.emptyEstablishmentList,
      );
    }

    return ListView.builder(
      itemCount: establishments.length,
      itemBuilder: (context, index) {
        return EstablishmentListingItem(
          establishmentDto: establishments[index],
        );
      },
    );
  }
}
