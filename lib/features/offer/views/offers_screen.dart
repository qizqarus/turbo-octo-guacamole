import 'package:flutter/material.dart';
import 'package:home_by_nb/features/search/views/search_screen.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Offers of the month',
          style: theme.titleLarge,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset(
                  'assets/banners/full4.png',
                ),
                const SizedBox(height: 10),
                Image.asset(
                  'assets/banners/full4.png',
                  width: 330,
                  height: 140,
                ),
                const SizedBox(height: 10),
                Image.asset(
                  'assets/banners/full4.png',
                  width: 330,
                  height: 140,
                ),
                const SizedBox(height: 10),
                Image.asset(
                  'assets/banners/full4.png',
                  width: 330,
                  height: 140,
                ),
                const SizedBox(height: 10),
                Image.asset(
                  'assets/banners/full4.png',
                  width: 330,
                  height: 140,
                ),
                const SizedBox(height: 10),
                Image.asset(
                  'assets/banners/full4.png',
                  width: 330,
                  height: 140,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
