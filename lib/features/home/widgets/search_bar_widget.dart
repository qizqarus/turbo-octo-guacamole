import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/features/search/views/search_screen.dart';
import 'package:home_by_nb/generated/l10n.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
          fillColor: const Color(0xffF5F5F5),
          filled: true,
          hintText: S.of(context).Search,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          hintStyle: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: Color(0xff737373),
            ),
          ),
          prefixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        onSubmitted: (String value) {
          if (value.isNotEmpty) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ));
          }
        },
      ),
    );
  }
}
