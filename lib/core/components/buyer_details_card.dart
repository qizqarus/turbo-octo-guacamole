import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/features/main/main_screen.dart';
import 'package:home_by_nb/core/utils/colors.dart';

class BuyerDetailCard extends StatelessWidget {
  final String? name;
  final String? address;
  final String? country;

  const BuyerDetailCard({
    super.key,
    this.name,
    this.address,
    this.country,
  });

  @override
  Widget build(BuildContext context) {
    bool isFilled = name?.isNotEmpty == true &&
        address?.isNotEmpty == true &&
        country?.isNotEmpty == true;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      color: AppColors.grey1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.assignment_ind_outlined),
                const SizedBox(width: 10),
                Text(
                  "Buyer details",
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                SizedBox(
                  width: 70,
                  height: 40,
                  child: AppButton(
                    iconSize: 20,
                    icon: isFilled ? Icons.edit_outlined : Icons.add_outlined,
                    text: isFilled ? "Edit" : "Add",
                    borderColor: Colors.black,
                    borderRadius: 4,
                    isOutlined: true,
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()),
                      ),
                    },
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      isFilled
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name!,
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    address!,
                                    style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    country!,
                                    style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                'You have not specified this address yet.',
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[500]),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
