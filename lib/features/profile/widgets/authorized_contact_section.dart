import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/features/profile/widgets/app_launch.dart';
import 'package:home_by_nb/generated/l10n.dart';

class AuthorizedContactSection extends StatelessWidget {
  const AuthorizedContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final appLaunch = AppLaunch();
    return Padding(
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
              appLaunch.launchPhone();
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
              appLaunch.launchMessenger();
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
              appLaunch.launchMail();
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
    );
  }
}
