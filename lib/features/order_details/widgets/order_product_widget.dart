import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/text_app.dart';
import 'package:home_by_nb/core/utils/colors.dart';

class OrderProductListWidget extends StatelessWidget {
  const OrderProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              AppText(
                text: "Products",
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              Spacer(),
              AppText(
                text: "€ 15.98",
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              const SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: Image.asset('assets/products/bath.png',
                        fit: BoxFit.cover),
                  ),
                ],
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "IDC INSTITUTE bath set \nMandarin&Grapefruit (shower gel, bo...",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Row(
                    children: [
                      AppText(
                        text: "€ 15.98",
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(width: 136),
                      AppText(
                        text: "€ 7.99 x 2",
                        color: AppColors.grey5,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
