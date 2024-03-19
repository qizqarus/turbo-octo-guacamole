// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/features/auth/views/auth_screen.dart';
import 'package:home_by_nb/features/main/main_screen.dart';
import 'package:home_by_nb/generated/l10n.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistScreen> {
  final storage = const FlutterSecureStorage();
  bool isUserLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    String? token = await storage.read(key: 'token');
    setState(() {
      isUserLoggedIn = token != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final message = Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(S.of(context).MainWishlist,
              textAlign: TextAlign.center, style: theme.bodyLarge),
          isUserLoggedIn
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    S.of(context).SubWishlistAuth,
                    textAlign: TextAlign.center,
                    style: theme.bodyMedium,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    S.of(context).SubWishlist,
                    textAlign: TextAlign.center,
                    style: theme.bodyMedium,
                  ),
                )
        ],
      ),
    );

    final buttonText =
        isUserLoggedIn ? S.of(context).Inspire : S.of(context).SignIn;
    final buttonAction = isUserLoggedIn
        ? () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
            )
        : () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AuthScreen(initialTabIndex: 0),
              ),
            );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).Wishlist,
          style: theme.titleLarge,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Align(
              alignment: Alignment.center,
              child: message,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: AppButton(
              text: buttonText,
              onPressed: buttonAction,
              backgroundColor: Colors.white,
              isOutlined: true,
              textColor: Colors.black,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
