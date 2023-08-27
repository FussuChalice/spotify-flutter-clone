import 'package:url_launcher/url_launcher.dart';

Future<void> utilLaunchUrl(Uri uri) async {
  if (!await canLaunchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
  
  await launchUrl(uri);
}

