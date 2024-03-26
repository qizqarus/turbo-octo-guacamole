// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:home_by_nb/core/components/custom_input.dart';
import 'package:http/http.dart' as http;

class PasswordFieldsWidget extends StatefulWidget {
  final bool isPassword;
  const PasswordFieldsWidget({super.key, this.isPassword = false});

  @override
  State<PasswordFieldsWidget> createState() => _PasswordFieldsWidgetState();
}

class _PasswordFieldsWidgetState extends State<PasswordFieldsWidget> {
  final storage = const FlutterSecureStorage();
  bool obscureText = false;
  bool _isChangeButtonEnabled = false;
  final TextEditingController _existingPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
    _existingPasswordController.addListener(_validateChangeFields);
    _newPasswordController.addListener(_validateChangeFields);
    _confirmPasswordController.addListener(_validateChangeFields);
  }

  @override
  void dispose() {
    _existingPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateChangeFields() {
    setState(() {
      _isChangeButtonEnabled = _existingPasswordController.text.isNotEmpty &&
          _newPasswordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty;
    });
  }

  Future<void> changePassword(BuildContext context) async {
    if (_newPasswordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('New password must be at least 8 characters long'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!_newPasswordController.text.contains(RegExp(r'[A-Z]'))) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('New password must contain at least one uppercase letter'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!_newPasswordController.text.contains(RegExp(r'[0-9]'))) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('New password must contain at least one digit'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_newPasswordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('New passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final userId = await storage.read(key: 'user_id');
      if (userId == null) {
        throw Exception("User ID not found in storage");
      }
      var response = await http.put(
        Uri.parse(
            'https://magento-1194376-4209178.cloudwaysapps.com/rest/default/V1/customers/me/password?customerId=$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer f6q6hz4nl275uj9u1x6o2jz6amj7vvaq',
        },
        body: jsonEncode({
          "currentPassword": _existingPasswordController.text,
          "newPassword": _confirmPasswordController.text,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password changed successful!'),
            backgroundColor: Colors.green,
          ),
        );

        _existingPasswordController.clear();
        _newPasswordController.clear();
        _confirmPasswordController.clear();
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${response.body}'),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Change Password',
          style: TextStyle(
              fontSize: 18,
              color: Colors.grey[800],
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Existing password',
          controller: _existingPasswordController,
          isPassword: true,
        ),
        const SizedBox(height: 12),
        CustomTextField(
          labelText: 'New password',
          controller: _newPasswordController,
          isPassword: true,
        ),
        const SizedBox(height: 12),
        CustomTextField(
          labelText: 'Confirm new password',
          controller: _confirmPasswordController,
          isPassword: true,
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          onPressed: _isChangeButtonEnabled
              ? () {
                  changePassword(context);
                }
              : null,
          style: ButtonStyle(
              side: MaterialStateProperty.all<BorderSide>(
                const BorderSide(
                  color: Color.fromRGBO(245, 245, 245, 1),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                  _isChangeButtonEnabled
                      ? Colors.black
                      : const Color.fromRGBO(245, 245, 245, 1)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 5)),
              minimumSize: MaterialStateProperty.all<Size>(
                  const Size(double.infinity, 48))),
          child: Text(
            'Change',
            style: GoogleFonts.roboto(
              color: _isChangeButtonEnabled ? Colors.white : Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
