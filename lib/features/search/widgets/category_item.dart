import 'package:flutter/material.dart';
import 'package:home_by_nb/features/product_list/views/product_list_screen.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: ListTile(
        title: Text(
          title,
          style: theme,
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductListScreen()),
          );
        },
      ),
    );
  }
}
