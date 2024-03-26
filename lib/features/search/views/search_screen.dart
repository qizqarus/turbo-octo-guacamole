// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:home_by_nb/features/home/widgets/brands_section_widget.dart';
import 'package:home_by_nb/features/home/widgets/search_bar_widget.dart';
import 'package:http/http.dart' as http;
import 'package:home_by_nb/features/search/widgets/category_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<Map<String, dynamic>>> futureCategories;

  Future<List<Map<String, dynamic>>> fetchCategories() async {
    final response = await http.get(
      Uri.parse(
        'https://magento-1194376-4209178.cloudwaysapps.com/rest/V1/categories/list?searchCriteria[pageSize]=224',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer f6q6hz4nl275uj9u1x6o2jz6amj7vvaq',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> items = responseData['items'];
      return items
          .where((category) => category['id'] != 1 && category['id'] != 2)
          .map<Map<String, dynamic>>(
              (category) => {'id': category['id'], 'name': category['name']})
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  void initState() {
    super.initState();
    futureCategories = fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Image.asset(
            'assets/app/nblogo.png',
            height: 30,
            width: 78,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const SearchBarWidget(),
                  const SizedBox(height: 20),
                  const BrandSectionWidget(),
                  const SizedBox(height: 20),
                  FutureBuilder<List<Map<String, dynamic>>>(
                    future: futureCategories,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final categories = snapshot.data ?? [];
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            return CategoryItemWidget(title: category['name']);
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
