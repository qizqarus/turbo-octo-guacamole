// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:home_by_nb/core/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool isPassword;
  final String? errorText;
  final bool isEnabled;

  const CustomTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.errorText,
    this.isEnabled = true,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: obscureText,
      keyboardType: widget.keyboardType,
      enabled: widget.isEnabled,
      decoration: InputDecoration(
        labelText: widget.labelText,
        errorText: widget.errorText,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.grey4,
                ),
              )
            : null,
        border: const OutlineInputBorder(),
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color:
              widget.errorText != null ? Colors.red : const Color(0xFF737373),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey8),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey2),
        ),
        floatingLabelStyle: const TextStyle(color: Colors.black),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      ),
    );
  }
}
