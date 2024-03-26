// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/features/home/widgets/product_card_widget.dart';
import 'package:home_by_nb/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopProductSectionWidget extends StatefulWidget {
  final String title;

  const TopProductSectionWidget({
    super.key,
    required this.title,
  });

  @override
  _TopProductSectionWidgetState createState() =>
      _TopProductSectionWidgetState();
}

class _TopProductSectionWidgetState extends State<TopProductSectionWidget> {
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _products = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
    _scrollController.addListener(_scrollListener);
  }

  Future<void> _fetchProducts() async {
    setState(() {
      _isLoading = true;
    });
    final response = await http.get(Uri.parse(
        'https://magento-1194376-4209178.cloudwaysapps.com/index.php/rest/V1/products?searchCriteria[pageSize]=500'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<Map<String, dynamic>> products =
          List<Map<String, dynamic>>.from(responseData['items']);
      setState(() {
        _products = products;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to load products');
    }
  }

  Future<void> _loadMoreProducts() async {
    setState(() {
      _isLoading = true;
    });

    final lastProduct = _products.isNotEmpty ? _products.last : null;

    final response = await http.get(Uri.parse(
        'https://magento-1194376-4209178.cloudwaysapps.com/index.php/rest/V1/products?searchCriteria[pageSize]=500&searchCriteria[afterId]=${lastProduct?['id'] ?? ''}'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<Map<String, dynamic>> additionalProducts =
          List<Map<String, dynamic>>.from(responseData['items']);

      setState(() {
        _products.addAll(additionalProducts);
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to load more products');
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.titleMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: theme,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: _products.length,
                    itemBuilder: (context, index) {
                      final product = _products[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ProductCardWidget(
                          productSKU: product['sku'],
                          title: product['name'],
                          price: product['price'].toString(),
                          imageUrl: product['media_gallery_entries'].isNotEmpty
                              ? 'https://magento-1194376-4209178.cloudwaysapps.com/pub/media/catalog/product/${product['media_gallery_entries'][0]['file']}'
                              : '',
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
