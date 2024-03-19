import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/features/main/main_screen.dart';
import 'package:home_by_nb/features/profile/widgets/notification.dart';
import 'package:home_by_nb/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthorizedProfileScreen extends StatelessWidget {
  const AuthorizedProfileScreen({super.key});
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const NotificationProfileWidget(),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  S.of(context).MyAccount,
                  style: theme.titleLarge,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: Colors.grey[200]!, width: 2),
                    ),
                    minimumSize: MaterialStateProperty.all(const Size(104, 80)),
                    maximumSize: MaterialStateProperty.all(const Size(104, 80)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Icon(
                          CarbonIcons.delivery_parcel,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          S.of(context).Orders,
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: Colors.grey[200]!, width: 1.2),
                    ),
                    maximumSize: MaterialStateProperty.all(const Size(104, 80)),
                    minimumSize: MaterialStateProperty.all(const Size(104, 80)),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          S.of(context).Addresses,
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: Colors.grey[200]!, width: 1.2),
                    ),
                    minimumSize: MaterialStateProperty.all(const Size(104, 80)),
                    maximumSize: MaterialStateProperty.all(const Size(104, 80)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.card_giftcard_outlined,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          S.of(context).GiftCards,
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _buildProfileItem(
            S.of(context).StockNotification,
            context,
            leadingIcon: Icons.notifications_outlined,
            destinationPageBuilder: () => const MainScreen(),
          ),
          _buildProfileItem(
            S.of(context).DetailPassword,
            context,
            leadingIcon: Icons.insert_drive_file_outlined,
            destinationPageBuilder: () => const MainScreen(),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  S.of(context).Support,
                  style: theme.titleLarge,
                ),
              ),
            ],
          ),
          _buildSupportItem(S.of(context).AboutHBNB, context),
          _buildSupportItem(S.of(context).PrivacyPolicy, context),
          _buildSupportItem(S.of(context).FAQ, context),
          _buildSupportItem(S.of(context).Returns, context),
          _buildSupportItem(S.of(context).Delivery, context),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  S.of(context).ContactUs,
                  style: theme.titleLarge,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: Colors.grey[200]!, width: 1.2),
                    ),
                    minimumSize: MaterialStateProperty.all(const Size(104, 80)),
                    maximumSize: MaterialStateProperty.all(const Size(104, 80)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  ),
                  onPressed: () {
                    _launchPhone('+37063458888');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.phone_outlined,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          S.of(context).Phone,
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: Colors.grey[200]!, width: 1.2),
                    ),
                    maximumSize: MaterialStateProperty.all(const Size(104, 80)),
                    minimumSize: MaterialStateProperty.all(const Size(104, 80)),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  onPressed: () {
                    _launchMessenger('homedecorbynb');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          S.of(context).Messenger,
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: Colors.grey[200]!, width: 1.2),
                    ),
                    minimumSize: MaterialStateProperty.all(const Size(104, 80)),
                    maximumSize: MaterialStateProperty.all(const Size(104, 80)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  ),
                  onPressed: () {
                    _launchMail('uzsakymai@homebynb.lt');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          S.of(context).Email,
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "I - F 09:00h - 17:00hVI 10:00h - 14:00h",
            style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey[800]),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: AppButton(
              text: S.of(context).SignOut,
              onPressed: () async {
                await storage.deleteAll();

                Navigator.pushReplacement(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              },
              textColor: Colors.white,
              borderRadius: 5.0,
              isOutlined: false,
              height: 50,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

Widget _buildSupportItem(String title, BuildContext context) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
    trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    },
  );
}

Widget _buildProfileItem(String title, BuildContext context,
    {IconData? leadingIcon,
    required Widget Function() destinationPageBuilder}) {
  return ListTile(
    leading:
        leadingIcon != null ? Icon(leadingIcon, color: Colors.black) : null,
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
    trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destinationPageBuilder()),
      );
    },
  );
}

_launchPhone(String phoneNumber) async {
  String uri = 'tel:$phoneNumber';
  Uri phoneUri = Uri.parse(uri);

  try {
    await launchUrl(phoneUri);
  } on PlatformException catch (e) {
    if (e.message?.contains('Could not launch') == true) {
    } else {}
  }
}

void _launchMail(String emailAddress) async {
  String uri = 'mailto:$emailAddress';
  Uri gmailUri = Uri.parse(uri);

  try {
    await launchUrl(gmailUri);
  } on PlatformException catch (e) {
    if (e.message?.contains('Could not launch') == true) {
    } else {}
  }
}

void _launchMessenger(String username) async {
  String uri = 'https://www.instagram.com/$username/';
  Uri instagramUri = Uri.parse(uri);

  try {
    await launchUrl(instagramUri);
  } on PlatformException catch (e) {
    if (e.message?.contains('Could not launch') == true) {
    } else {}
  }
}
