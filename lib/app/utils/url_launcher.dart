import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncher {
  static Future<void> launchUrlExternal(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchEmailUrl(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (!await launchUrl(emailLaunchUri)) {
      throw 'Could not launch email client';
    }
  }
}
