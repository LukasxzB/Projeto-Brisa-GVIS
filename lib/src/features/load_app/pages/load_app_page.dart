import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/features/crashed_app/pages/crashed_app_page.dart';
import 'package:gvis_mobilidade/src/features/dashboard/pages/dashboard_page.dart';
import 'package:gvis_mobilidade/src/features/load_app/pages/load_app_page_bloc.dart';
import 'package:gvis_mobilidade/src/features/load_app/utils/load_app_initial_page.dart';
import 'package:gvis_mobilidade/src/features/login/pages/login_page.dart';
import 'package:gvis_mobilidade/src/shared_widgets/loading/AppLoading.dart';
import 'package:gvis_mobilidade/src/utils/types/pair.dart';

///
/// [LoadAppPage] é a primeira tela do aplicativo, responsável por
/// verificar se o usuário está logado ou não, e redirecionar para
/// a tela de login ou dashboard.
///
class LoadAppPage extends StatelessWidget {
  const LoadAppPage({super.key});

  static final LoadAppPageBloc _bloc = LoadAppPageBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LoadAppInitialPage>(
      stream: _bloc.initialPageStream,
      initialData: LoadAppInitialPage.unknown,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Pair<String, String> error = snapshot.error as Pair<String, String>;
          return CrashedAppPage(errorMessage: error.second, title: error.first);
        }

        if (snapshot.data == LoadAppInitialPage.unknown) {
          return AppLoading(text: AppString.loadingApp);
        }

        if (snapshot.data == LoadAppInitialPage.dashboard) {
          return const DashboardPage();
        }

        return const LoginPage();
      },
    );
  }
}
