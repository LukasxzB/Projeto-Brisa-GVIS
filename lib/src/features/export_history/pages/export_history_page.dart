import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/features/export_history/local_widgets/export_history_item/export_history_item.dart';
import 'package:gvis_mobilidade/src/shared_widgets/page/app_base_page.dart';
import 'package:gvis_mobilidade/src/shared_widgets/titlebar/app_titlebar.dart';

class ExportHistoryPage extends StatelessWidget {
  const ExportHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Column(
        children: <Widget>[
          AppTitlebar(title: AppString.exports),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ExportHistoryItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
