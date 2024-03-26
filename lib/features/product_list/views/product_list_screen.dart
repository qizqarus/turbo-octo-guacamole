import 'package:flutter/material.dart';
import 'package:home_by_nb/features/home/widgets/product_card_widget.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'TOP TIT -20%',
          style: theme.titleLarge,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: (1 / 1.3),
                children: List.generate(12, (index) {
                  return ProductCardWidget(
                    title: 'Product $index',
                    price: '10.99',
                    imageUrl: 'assets/products/croco.png',
                    discount: 20,
                    productSKU: 'asda',
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
