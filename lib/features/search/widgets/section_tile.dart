import 'package:flutter/material.dart';

class SectionTileWidget extends StatelessWidget {
  final String title;
  const SectionTileWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.bodyLarge;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: theme,
        ),
      ),
    );
  }
}
