import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginRegisterButton extends StatelessWidget {
  const LoginRegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.white,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        child: Container(
          height: 48,
          alignment: Alignment.center,
          child: Text(
            "Register",
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
