import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/features/dashboard/local_widgets/button/small_option/dashboard_small_option_item.dart';
import 'package:gvis_mobilidade/src/features/dashboard/local_widgets/user_info/dashboard_user_info.dart';
import 'package:gvis_mobilidade/src/features/dashboard/pages/dashboard_page_bloc.dart';
import 'package:gvis_mobilidade/src/shared_widgets/page/app_base_page.dart';
import '../local_widgets/button/squareButton/squareButton.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static final DashboardPageBloc _bloc = DashboardPageBloc();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Wrap(
        runSpacing: 6,
        children: [
          const DashboardUserInfo(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomSquareButton(
                label: AppString.importData,
                svgIconPath: 'assets/svg_icons/import.svg',
                onPressed: () => _bloc.openImportDialog(context),
              ),
              CustomSquareButton(
                label: AppString.exportData,
                svgIconPath:
                    'assets/svg_icons/export.svg', // Substitua pelo caminho correto
                onPressed: () => debugPrint('clicado'),
              ),
            ],
          ),
          SizedBox(height: 10),
          DashboardSmallOption(
            buttonText: AppString.evaluations,
            appSvgPath: AppSvgPath.evaluationIcon,
            onPressed: () => _bloc.openEvaluationListingPage(context),
          ),
          DashboardSmallOption(
            buttonText: AppString.establishments,
            appSvgPath: AppSvgPath.establishmentIcon,
            onPressed: () => _bloc.openEstablishmentListingPage(context),
          ),
          DashboardSmallOption(
            buttonText: AppString.autoAvulso,
            appSvgPath: AppSvgPath.evaluationIcon,
            onPressed: () => debugPrint('clicado'),
          ),
          DashboardSmallOption(
            buttonText: AppString.exportHistory,
            appSvgPath: AppSvgPath.historyIcon,
            onPressed: () => _bloc.openExportHistoryPage(context),
          ),
          DashboardSmallOption(
            buttonText: AppString.logoff,
            appSvgPath: AppSvgPath.logoffIcon,
            primaryColor: AppColor.redFatal,
            onPressed: () => _bloc.logoff(context),
          ),
          DashboardSmallOption(
            buttonText: AppString.deleteAllData,
            appSvgPath: AppSvgPath.deleteForeverIcon,
            primaryColor: AppColor.redPink,
            onPressed: () => _bloc.deleteAllData(context),
          ),
        ],
      ),
    );
  }
}
