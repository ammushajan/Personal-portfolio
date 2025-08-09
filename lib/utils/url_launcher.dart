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

  ///[encodeQueryParameters] Encodes a map of query parameters into a URL-encoded query string.
  static String? encodeQueryParameters(Map<String, String> params) {
    // Map each entry to a URL-encoded key-value pair and join them with '&'
    return params.entries
        .map(
          (MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }

  Future<void> sendEmail({
    required String recipient,
    String? subject,
    String? body,
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: recipient,
      query: encodeQueryParameters(<String, String>{
        'subject': subject ?? '',
        'body': body ?? '',
      }),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }
}
