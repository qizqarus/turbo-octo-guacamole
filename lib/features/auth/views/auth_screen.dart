// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/core/components/custom_input.dart';
import 'package:home_by_nb/features/main/main_screen.dart';
import 'package:home_by_nb/generated/l10n.dart';
import 'package:http/http.dart' as http;

class AuthScreen extends StatefulWidget {
  final int initialTabIndex;
  const AuthScreen({super.key, required this.initialTabIndex});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        initialIndex: widget.initialTabIndex, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset('assets/app/nblogo.png'),
          const SizedBox(
            height: 30,
          ),
          TabBarWidget(
            tabController: _tabController,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _SignInForm(),
                _RegisterForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  final TabController tabController;

  const TabBarWidget({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: [
        Tab(text: S.of(context).SignIn),
        Tab(text: S.of(context).Register),
      ],
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
    );
  }
}

class _SignInForm extends StatefulWidget {
  @override
  State<_SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<_SignInForm> {
  final storage = const FlutterSecureStorage();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? emailErrorText;
  String? passwordErrorText;

  bool isFieldsFilled = false;

  void checkFieldsFilled() {
    setState(() {
      isFieldsFilled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(checkFieldsFilled);
    passwordController.addListener(checkFieldsFilled);
  }

  Future<void> login(BuildContext context) async {
    setState(() {
      emailErrorText = null;
      passwordErrorText = null;
    });

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() {
        emailErrorText = 'Please fill in all fields';
        passwordErrorText = 'Please fill in all fields';
      });
      return;
    }

    if (passwordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 8 characters long'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Loading...'),
          backgroundColor: Colors.green,
        ),
      );
      var response = await http.post(
        Uri.parse(
            'https://magento-1194376-4209178.cloudwaysapps.com/rest/V1/integration/customer/token'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "username": emailController.text,
          "password": passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        String token = response.body.replaceAll('"', '');
        await storage.write(key: 'token', value: token);
        await storage.write(key: 'email', value: emailController.text);

        var userInfoResponse = await http.get(
          Uri.parse(
              'https://magento-1194376-4209178.cloudwaysapps.com/rest/V1/customers/search?searchCriteria[filterGroups][0][filters][0][field]=email&searchCriteria[filterGroups][0][filters][0][value]=${emailController.text}'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer f6q6hz4nl275uj9u1x6o2jz6amj7vvaq',
          },
        );

        if (userInfoResponse.statusCode == 200) {
          var userData = jsonDecode(userInfoResponse.body);
          var user = userData['items'][0];
          int userId = user['id'];
          String userEmail = user['email'];
          String userFirstName = user['firstname'];
          String userLastName = user['lastname'];

          await storage.write(key: 'user_id', value: userId.toString());
          await storage.write(key: 'user_email', value: userEmail);
          await storage.write(key: 'user_firstname', value: userFirstName);
          await storage.write(key: 'user_lastname', value: userLastName);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sign in successful!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${userInfoResponse.body}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email or password.'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${response.body}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            controller: emailController,
            labelText: S.of(context).Email,
            isPassword: false,
            errorText: emailErrorText,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            controller: passwordController,
            labelText: S.of(context).Password,
            isPassword: true,
            errorText: passwordErrorText,
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            },
            child: Text(
              S.of(context).Forgot,
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton(
            onPressed: () {
              login(context);
            },
            style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
                  const BorderSide(color: Colors.black, width: 1.2),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 5)),
                minimumSize: MaterialStateProperty.all<Size>(
                    const Size(double.infinity, 48))),
            child: const Text(
              'Sign in',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  String? emailErrorText;
  String? passwordErrorText;
  String? nameErrorText;
  String? surnameErrorText;

  Future<void> register(BuildContext context) async {
    setState(() {
      emailErrorText = null;
      passwordErrorText = null;
      nameErrorText = null;
      surnameErrorText = null;
    });

    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty ||
        surnameController.text.isEmpty) {
      setState(() {
        emailErrorText = 'Please fill in all fields';
        passwordErrorText = 'Please fill in all fields';
        nameErrorText = 'Please fill in all fields';
        surnameErrorText = 'Please fill in all fields';
      });
      return;
    }

    if (passwordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 8 characters long'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!passwordController.text.contains(RegExp(r'[A-Z]'))) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must contain at least one uppercase letter'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!passwordController.text.contains(RegExp(r'[0-9]'))) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must contain at least one digit'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email address'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      var response = await http.post(
        Uri.parse(
            'https://magento-1194376-4209178.cloudwaysapps.com/rest/V1/customers'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "customer": {
            "email": emailController.text,
            "firstname": nameController.text,
            "lastname": surnameController.text,
          },
          "password": passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration was successful! Please sign in'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${response.body}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            CustomTextField(
              controller: emailController,
              labelText: S.of(context).Email,
              isPassword: false,
              errorText: emailErrorText,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: passwordController,
              labelText: S.of(context).Password,
              isPassword: true,
              errorText: passwordErrorText,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: nameController,
              labelText: S.of(context).Name,
              isPassword: false,
              errorText: nameErrorText,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: surnameController,
              labelText: S.of(context).Surname,
              isPassword: false,
              errorText: nameErrorText,
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: S.of(context).LoginPart1,
                  ),
                  TextSpan(
                    text: S.of(context).LoginPart2,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: S.of(context).LoginPart3,
                  ),
                  TextSpan(
                    text: S.of(context).LoginPart4,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    S.of(context).LoginBody,
                    textAlign: TextAlign.left,
                    style:
                        GoogleFonts.roboto(fontSize: 12.0, color: Colors.grey),
                  ),
                ),
                SwitchTheme(
                  data: SwitchThemeData(
                    thumbColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.black;
                      }
                      return Colors.white;
                    }),
                    trackColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.grey;
                      }
                      return Colors.grey[300];
                    }),
                  ),
                  child: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            AppButton(
              text: S.of(context).Register,
              onPressed: () {
                register(context);
              },
              textColor: Colors.white,
              borderRadius: 5.0,
              isOutlined: false,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
