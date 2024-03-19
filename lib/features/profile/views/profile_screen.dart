// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:home_by_nb/features/profile/views/authorized_profile_screen.dart';
import 'package:home_by_nb/features/profile/views/unauthorized_profile_screen.dart';
import 'package:home_by_nb/generated/l10n.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfileScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).Profile,
          style: theme.titleLarge,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          isUserLoggedIn
              ? const AuthorizedProfileScreen()
              : const UnauthorizedProfileScreen(),
        ],
      ),
    );
  }
}
