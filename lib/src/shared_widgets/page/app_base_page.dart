import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/shared_widgets/appbar/app_appbar.dart';

///
/// [AppBasePage] é uma página que serve como base para as páginas do app.
/// A página [AppBasePage] contém um [AppAppbar] e um [SafeArea] com um
/// [Padding] de 12 em todas as direções.
///

class AppBasePage extends StatelessWidget {
  const AppBasePage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppbar(),
      backgroundColor: AppColor.whitePure,
      body: SafeArea(
        minimum: const EdgeInsets.all(12),
        child: child,
      ),
    );
  }
}
