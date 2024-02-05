import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_dto/establishment/establishment_dto.dart';
import 'package:gvis_mobilidade/src/features/establishment/local_widgets/establishment_listing.dart';
import 'package:gvis_mobilidade/src/features/establishment/pages/establishment_listing_bloc.dart';
import 'package:gvis_mobilidade/src/shared_widgets/button/app_button.dart';
import 'package:gvis_mobilidade/src/shared_widgets/image/app_logo_rounded.dart';
import 'package:gvis_mobilidade/src/shared_widgets/loading/AppLoading.dart';
import 'package:gvis_mobilidade/src/shared_widgets/page/app_base_page.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text_search_input/app_text_search_input.dart';
import 'package:gvis_mobilidade/src/shared_widgets/titlebar/app_titlebar.dart';

class EstablishmentListingPage extends StatelessWidget {
  const EstablishmentListingPage({super.key});

  static final _bloc = EstablishmentListingBloc();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              AppTitlebar(title: AppString.establishments),
              AppTextSearchInput(
                hintText: AppString.searchEstablishment,
                runFilterFunction: _bloc.runFilter,
                filterTextStream: _bloc.filterTextStream,
                filterTextStreamSinkAdd: _bloc.filterTextStreamSinkAdd,
              ),
            ],
          ),
          Flexible(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                _buildEstablishmentListing(),
              ],
            ),
          ),
          AppButton(
            buttonText: AppString.createEstablishment,
            buttonTextStyle: AppTextStyle.regular14(color: AppColor.whitePure),
            onPressed: () => _bloc.onCreateNewEstablishment(context),
          ),
        ],
      ),
    );
  }

  FutureBuilder<void> _buildEstablishmentListing() {
    return FutureBuilder<void>(
      future: _bloc.getEstablishmentListFromDB(),
      builder: (context, snapshot) {
        return StreamBuilder<List<EstablishmentDTO>?>(
          stream: _bloc.filteredEstablishmentsStream,
          builder: (ctx, snp) {
            if (snp.data == null) {
              return AppLoading(text: AppString.loadingEstablishmentList);
            }

            List<EstablishmentDTO> establishments = snp.data ?? [];
            return Flexible(
              child: EstablishmentListing(establishments: establishments),
            );
          },
        );
      },
    );
  }
}
