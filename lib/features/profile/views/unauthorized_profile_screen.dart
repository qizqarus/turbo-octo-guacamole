import 'package:flutter/material.dart';
import 'package:home_by_nb/features/home/widgets/personal_section_widget.dart';
import 'package:home_by_nb/features/profile/widgets/unauthorized_contact_section.dart';
import 'package:home_by_nb/features/profile/widgets/support_item.dart';
import 'package:home_by_nb/generated/l10n.dart';

class UnauthorizedProfileScreen extends StatelessWidget {
  const UnauthorizedProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const PersonalSectionWidget(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).Support,
                style: theme.titleLarge,
              ),
            ),
          ),
          SupportItem(title: S.of(context).AboutHBNB),
          SupportItem(title: S.of(context).PrivacyPolicy),
          SupportItem(title: S.of(context).FAQ),
          SupportItem(title: S.of(context).Returns),
          SupportItem(title: S.of(context).Delivery),
          const UnauthorizedContactSection(),
          Text(
            "I - F 09:00h - 17:00hVI 10:00h - 14:00h",
            style: theme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
