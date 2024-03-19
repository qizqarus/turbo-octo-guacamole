import 'package:flutter/material.dart';
import 'package:home_by_nb/features/product_list/views/product_list_screen.dart';
import 'package:home_by_nb/generated/l10n.dart';

class BrandSectionWidget extends StatelessWidget {
  const BrandSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.titleMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).Brands,
            style: theme,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductListScreen()),
                      );
                    },
                    child: Image.asset('assets/products/brand.jpeg'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
