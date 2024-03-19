import 'package:flutter/material.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/features/auth/views/auth_screen.dart';
import 'package:home_by_nb/generated/l10n.dart';

class PersonalSectionWidget extends StatelessWidget {
  const PersonalSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            S.of(context).LoginSection1,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          Text(
            S.of(context).LoginSection2,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppButton(
                  text: S.of(context).Register,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AuthScreen(initialTabIndex: 1)),
                    );
                  },
                  backgroundColor: Colors.transparent,
                  textColor: Colors.black,
                  borderRadius: 5.0,
                  isOutlined: true,
                  height: 48,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppButton(
                  text: S.of(context).SignIn,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AuthScreen(initialTabIndex: 0)),
                    );
                  },
                  textColor: Colors.white,
                  borderRadius: 5.0,
                  isOutlined: false,
                  height: 48,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
