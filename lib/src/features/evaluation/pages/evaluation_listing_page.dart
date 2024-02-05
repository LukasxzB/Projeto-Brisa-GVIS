import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_dto/evaluation/evaluation_dto.dart';
import 'package:gvis_mobilidade/src/features/evaluation/local_widgets/evaluation_listing/evaluation_listing.dart';
import 'package:gvis_mobilidade/src/features/evaluation/pages/evaluation_listing_page_bloc.dart';
import 'package:gvis_mobilidade/src/shared_widgets/loading/AppLoading.dart';
import 'package:gvis_mobilidade/src/shared_widgets/page/app_base_page.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text_search_input/app_text_search_input.dart';
import 'package:gvis_mobilidade/src/shared_widgets/titlebar/app_titlebar.dart';

class EvaluationListingPage extends StatelessWidget {
  const EvaluationListingPage({super.key});

  static final _bloc = EvaluationListingPageBloc();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Column(
        children: <Widget>[
          AppTitlebar(title: AppString.evaluations),
          const SizedBox(height: 5),
          AppTextSearchInput(
            filterTextStream: _bloc.filterTextStream,
            filterTextStreamSinkAdd: _bloc.filterTextStreamSinkAdd,
            hintText: AppString.searchEvaluation,
            runFilterFunction: _bloc.runFilter,
          ),
          const SizedBox(height: 5),
          FutureBuilder<bool?>(
            future: _bloc.getAllEvaluations(),
            initialData: null,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Expanded(
                  child: Center(
                    child: AppLoading(text: AppString.loadingEvaluationList),
                  ),
                );
              }
              return _buildEvaluationListing();
            },
          ),
        ],
      ),
    );
  }

  StreamBuilder<List<EvaluationDTO>?> _buildEvaluationListing() {
    return StreamBuilder<List<EvaluationDTO>?>(
        stream: _bloc.evaluationListStream,
        initialData: null,
        builder: (context, snapshot) {
          return EvaluationListing(
            evaluations: snapshot.data,
          );
        });
  }
}
