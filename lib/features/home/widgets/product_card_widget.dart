// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:home_by_nb/features/product/views/product_screen.dart';

class ProductCardWidget extends StatelessWidget {
  final String title;
  final String price;
  final String? oldPrice;
  final String imageUrl;
  final double? discount;
  final String productSKU;

  const ProductCardWidget({
    super.key,
    required this.title,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
    this.discount,
    required this.productSKU,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    TextStyle defaultPriceStyle = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    TextStyle oldPriceStyle = defaultPriceStyle.copyWith(
      color: Colors.grey[500],
      decoration: TextDecoration.lineThrough,
    );

    TextStyle newPriceStyle = defaultPriceStyle.copyWith(
      color: Colors.red,
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(productSKU: productSKU),
          ),
        );
      },
      child: SizedBox(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (discount != null)
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 32,
                      height: 19,
                      color: Colors.grey[100],
                      child: Center(
                        child: Text(
                          '${discount}%',
                          style: theme.labelLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                const Positioned(
                  top: 0,
                  right: 0,
                  child: Icon(
                    Icons.star_border,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (oldPrice != null)
                  Text(
                    '€ $oldPrice',
                    style: oldPriceStyle,
                  ),
                if (oldPrice != null) const SizedBox(width: 4),
                Text(
                  '€ $price',
                  style: oldPrice != null ? newPriceStyle : defaultPriceStyle,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(color: Colors.black),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
