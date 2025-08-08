import 'package:url_launcher/url_launcher.dart';

///[UrlLauncher] is a utility class for launching URLs
class UrlLauncher {
  ///[launchInBrowser] launches the given URL in the default browser.
  Future<void> launchInBrowser(String url) async {
    final urlToLaunch = Uri.parse(url);
    try {
      if (await canLaunchUrl(urlToLaunch)) {
        launchUrl(urlToLaunch);
      }
    } catch (e) {
      rethrow;
    }
  }
}
