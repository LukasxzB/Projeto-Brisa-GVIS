import 'package:url_launcher/url_launcher.dart';

class AppUrlLauncher {
  static Future<void> launchUrlOnBrowser(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
