import 'package:url_launcher/url_launcher.dart';

class AppLaunch {
  void launchPhone() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '+37063458888',
    );
    await launchUrl(launchUri);
  }

  void launchMail() async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: 'uzsakymai@homebynb.lt',
    );
    await launchUrl(launchUri);
  }

  void launchMessenger() async {
    Uri instagramUri = Uri.parse('https://www.instagram.com/homedecorbynb');
    await launchUrl(instagramUri);
  }
}
