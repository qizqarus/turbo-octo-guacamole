import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/features/details_password/widgets/details_fields_widget.dart';
import 'package:home_by_nb/features/details_password/widgets/password_fiels_widget.dart';

class DetailPasswordScreen extends StatelessWidget {
  const DetailPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: Text('Detail & password',
            style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailFieldsWidget(),
              SizedBox(height: 30),
              PasswordFieldsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
