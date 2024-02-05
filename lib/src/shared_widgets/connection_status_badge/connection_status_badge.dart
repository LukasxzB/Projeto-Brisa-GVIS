import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/services/network_status/network_status.dart';
import 'package:gvis_mobilidade/src/services/network_status/network_status_service.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_svg_asset.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class ConnectionStatusBadge extends StatelessWidget {
  const ConnectionStatusBadge({super.key, required this.fullSizeBadge});

  final bool fullSizeBadge;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<NetworkStatus>(
      stream: NetworkStatusService().networkStatusStream,
      initialData: NetworkStatus.unknown,
      builder: (context, snapshot) {
        return Container(
          decoration: BoxDecoration(
            color: _getConnectionBackgroundColor(snapshot.data!),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Padding(
            padding: const EdgeInsets.all(1.5),
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: _buildBadge(snapshot.data!),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBadge(NetworkStatus status) {
    if (!fullSizeBadge) {
      return _getWifiIcon(status);
    }

    return AnimatedSize(
      duration: const Duration(milliseconds: 75),
      curve: Curves.easeInOut,
      child: AppText(
        textStyle: AppTextStyle.regular14(color: AppColor.whitePure),
        text: _getConnectionStatusText(status),
        leftIcon: _getWifiIcon(status),
      ),
    );
  }

  String _getConnectionStatusText(NetworkStatus status) {
    switch (status) {
      case NetworkStatus.connected:
        return AppString.connected;
      case NetworkStatus.disconnected:
        return AppString.disconnected;
      default:
        return AppString.verifing;
    }
  }

  Color _getConnectionBackgroundColor(NetworkStatus status) {
    switch (status) {
      case NetworkStatus.connected:
        return AppColor.greenForest;
      case NetworkStatus.disconnected:
        return AppColor.redCoral;
      default:
        return AppColor.grayMedium;
    }
  }

  AppSvgAsset _getWifiIcon(NetworkStatus status) {
    return AppSvgAsset(
      appSvgPath: status == NetworkStatus.connected
          ? AppSvgPath.wifiIcon
          : AppSvgPath.wifiOffIcon,
      width: 18,
      height: 18,
      color: AppColor.whitePure,
    );
  }
}
