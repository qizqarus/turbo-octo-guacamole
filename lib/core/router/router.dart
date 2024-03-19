import 'package:home_by_nb/features/cart/views/cart_screen.dart';
import 'package:home_by_nb/features/main/main_screen.dart';
import 'package:home_by_nb/features/offer/views/offers_screen.dart';
import 'package:home_by_nb/features/product/views/product_screen.dart';
import 'package:home_by_nb/features/product_list/views/product_list_screen.dart';
import 'package:home_by_nb/features/search/views/search_screen.dart';

final routes = {
  '/': (context) => const MainScreen(),
  '/offer': (context) => const OffersScreen(),
  '/search': (context) => const SearchScreen(),
  '/products': (context) => const ProductListScreen(),
  '/product': (context) => ProductScreen(),
  '/cart': (context) => const CartScreen(),
};
