// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/features/details_password/view/details_password_screen.dart';
import 'package:home_by_nb/features/main/main_screen.dart';
import 'package:home_by_nb/features/profile/widgets/authorized_contact_section.dart';
import 'package:home_by_nb/features/profile/widgets/main_profile_buttons.dart';
import 'package:home_by_nb/features/profile/widgets/notification.dart';
import 'package:home_by_nb/features/profile/widgets/profile_item.dart';
import 'package:home_by_nb/features/profile/widgets/support_item.dart';
import 'package:home_by_nb/features/stock_notification/view/stock_notification_screen.dart';
import 'package:home_by_nb/generated/l10n.dart';
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
          const MainProfieButtons(),
          const SizedBox(
            height: 10,
          ),
          ProfileItem(
            title: S.of(context).StockNotification,
            leadingIcon: Icons.notifications_outlined,
            destinationPageBuilder: () => const StockNotigicationScreen(),
          ),
          ProfileItem(
            title: S.of(context).DetailPassword,
            leadingIcon: Icons.insert_drive_file_outlined,
            destinationPageBuilder: () => const DetailPasswordScreen(),
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
          SupportItem(title: S.of(context).AboutHBNB),
          SupportItem(title: S.of(context).PrivacyPolicy),
          SupportItem(title: S.of(context).FAQ),
          SupportItem(title: S.of(context).Returns),
          SupportItem(title: S.of(context).Delivery),
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
          const AuthorizedContactSection(),
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
