// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/custom_input.dart';
import 'package:http/http.dart' as http;

class DetailFieldsWidget extends StatefulWidget {
  const DetailFieldsWidget({super.key});

  @override
  State<DetailFieldsWidget> createState() => _DetailFieldsWidgetState();
}

class _DetailFieldsWidgetState extends State<DetailFieldsWidget> {
  final storage = const FlutterSecureStorage();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isSaveButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadSavedValues();
    _nameController.addListener(_validateSaveFields);
    _surnameController.addListener(_validateSaveFields);
    _emailController.addListener(_validateSaveFields);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _loadSavedValues() async {
    String? name = await storage.read(key: 'user_firstname');
    String? surname = await storage.read(key: 'user_lastname');
    String? email = await storage.read(key: 'user_email');

    setState(() {
      _nameController.text = name ?? '';
      _surnameController.text = surname ?? '';
      _emailController.text = email ?? '';
      _validateSaveFields();
    });
  }

  void _validateSaveFields() {
    setState(() {
      _isSaveButtonEnabled = _nameController.text.isNotEmpty &&
          _surnameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty;
    });
  }

  Future<void> changeDetails(BuildContext context) async {
    try {
      final userId = await storage.read(key: 'user_id');
      if (userId == null) {
        throw Exception("User ID not found in storage");
      }
      var response = await http.put(
        Uri.parse(
            'https://magento-1194376-4209178.cloudwaysapps.com/rest/default/V1/customers/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer f6q6hz4nl275uj9u1x6o2jz6amj7vvaq',
        },
        body: jsonEncode({
          "customer": {
            "lastname": _nameController.text,
            "firstname": _surnameController.text,
          }
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Details changed successful!'),
            backgroundColor: Colors.green,
          ),
        );
        await storage.write(key: 'user_firstname', value: _nameController.text);
        await storage.write(
            key: 'user_lastname', value: _surnameController.text);
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
        CustomTextField(
          labelText: 'Name',
          controller: _nameController,
        ),
        const SizedBox(
          height: 12,
        ),
        CustomTextField(
          labelText: 'Surname',
          controller: _surnameController,
        ),
        const SizedBox(
          height: 12,
        ),
        CustomTextField(
          labelText: 'Email',
          controller: _emailController,
          isEnabled: false,
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          onPressed: _isSaveButtonEnabled
              ? () {
                  changeDetails(context);
                }
              : null,
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              _isSaveButtonEnabled
                  ? Colors.black
                  : const Color.fromRGBO(245, 245, 245, 1),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(double.infinity, 48),
            ),
          ),
          child: Text(
            'Save',
            style: GoogleFonts.roboto(
              color: _isSaveButtonEnabled ? Colors.white : Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
