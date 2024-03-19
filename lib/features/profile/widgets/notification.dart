import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/generated/l10n.dart';

class NotificationProfileWidget extends StatefulWidget {
  final bool isNotificationVisible = true;
  const NotificationProfileWidget({super.key});

  @override
  State<NotificationProfileWidget> createState() =>
      _NotificationProfileWidgetState();
}

class _NotificationProfileWidgetState extends State<NotificationProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    S.of(context).NotificationHeader,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {});
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              S.of(context).NotificationBody,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: S.of(context).Notify,
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  borderRadius: 5.0,
                  isOutlined: true,
                  height: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
