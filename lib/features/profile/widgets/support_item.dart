import 'package:flutter/material.dart';
import 'package:home_by_nb/features/main/main_screen.dart';

class SupportItem extends StatelessWidget {
  final String title;
  const SupportItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ListTile(
      title: Text(title, style: theme.bodySmall),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      },
    );
  }
}
