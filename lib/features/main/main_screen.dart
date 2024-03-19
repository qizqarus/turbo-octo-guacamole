import 'package:flutter/material.dart';
import 'package:home_by_nb/features/cart/views/cart_screen.dart';
import 'package:home_by_nb/features/home/views/home_screen.dart';
import 'package:home_by_nb/features/profile/views/profile_screen.dart';
import 'package:home_by_nb/features/search/views/search_screen.dart';
import 'package:home_by_nb/features/wishlist/views/wishlist_screen.dart';
import 'package:home_by_nb/generated/l10n.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainPageState();
}

class _MainPageState extends State<MainScreen> {
  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTab,
        children: [
          HomeScreen(),
          const WishlistScreen(),
          const SearchScreen(),
          const CartScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: S.of(context).Home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star_border_outlined),
            label: S.of(context).Wishlist,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.manage_search_outlined),
            label: S.of(context).Search,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_bag_outlined),
            label: S.of(context).Cart,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.perm_identity_outlined),
            label: S.of(context).Profile,
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
