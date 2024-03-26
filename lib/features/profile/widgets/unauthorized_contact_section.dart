import 'package:flutter/material.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/features/profile/widgets/app_launch.dart';
import 'package:home_by_nb/generated/l10n.dart';

class UnauthorizedContactSection extends StatelessWidget {
  const UnauthorizedContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final appLaunch = AppLaunch();
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(S.of(context).ContactUs, style: theme.titleSmall),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppButton(
                  text: S.of(context).Phone,
                  icon: Icons.phone_outlined,
                  onPressed: () {
                    appLaunch.launchPhone();
                  },
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  borderColor: Colors.grey,
                  borderRadius: 5.0,
                  isOutlined: true,
                  height: 50,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: AppButton(
                  text: S.of(context).Email,
                  icon: Icons.mail_outline,
                  onPressed: () {
                    appLaunch.launchMail();
                  },
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  borderColor: Colors.grey,
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
