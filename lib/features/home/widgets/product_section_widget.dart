import 'package:flutter/material.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/generated/l10n.dart';
import 'product_card_widget.dart';

class ProductSectionWidget extends StatelessWidget {
  final String title;

  const ProductSectionWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.titleMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: ProductCardWidget(
                    title: 'Donut for keys',
                    price: '10.50',
                    oldPrice: '29.00',
                    imageUrl: 'assets/products/croco.png',
                    discount: 20,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AppButton(
            onPressed: () {
              Navigator.pushNamed(context, '/products');
            },
            text: S.of(context).ShopNow,
            backgroundColor: Colors.transparent,
            isOutlined: true,
            textColor: Colors.black,
            height: 48,
          ),
        ],
      ),
    );
  }
}
