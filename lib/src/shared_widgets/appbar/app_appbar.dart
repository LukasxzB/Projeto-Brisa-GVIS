import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/shared_widgets/appbar/app_appbar_bloc.dart';
import 'package:gvis_mobilidade/src/shared_widgets/connection_status_badge/connection_status_badge.dart';
import 'package:gvis_mobilidade/src/shared_widgets/image/app_logo_rounded.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar({super.key});

  static final AppAppbarBloc _bloc = AppAppbarBloc();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 240,
      backgroundColor: AppColor.whitePure,
      elevation: 0,
      leading: Row(
        children: [
          const SizedBox(width: 8),
          const AppLogoRounded(size: 36),
          const SizedBox(width: 10),
          AppText(
            textStyle: AppTextStyle.regular21(),
            text: AppString.appTitle,
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            _buildLastSyncedAtText(),
            const SizedBox(width: 8),
          ],
        ),
      ],
    );
  }

  Row _buildLastSyncedAtText() {
    return Row(
      children: [
        StreamBuilder<DateTime?>(
          stream: _bloc.lastSyncedAtStream,
          initialData: null,
          builder: (context, snapshot) {
            String text = AppString.noSyncedData;
            if (snapshot.data != null) {
              text = AppString.lastSyncedAt(snapshot.data!.toString());
            }

            return AppText(
              textStyle: AppTextStyle.regular14(),
              text: text,
            );
          },
        ),
        const SizedBox(width: 6),
        const ConnectionStatusBadge(fullSizeBadge: false),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
