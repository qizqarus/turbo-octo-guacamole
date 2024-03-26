import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/features/addresses/view/addresses_screen.dart';
import 'package:home_by_nb/features/gift_cards/view/gift_cards_screen.dart';
import 'package:home_by_nb/generated/l10n.dart';

class MainProfieButtons extends StatelessWidget {
  const MainProfieButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            style: ButtonStyle(
              alignment: Alignment.center,
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(color: Colors.grey[200]!, width: 2),
              ),
              minimumSize: MaterialStateProperty.all(const Size(104, 80)),
              maximumSize: MaterialStateProperty.all(const Size(104, 80)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            ),
            onPressed: () {
              Navigator.pushNamed((context), '/orders');
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Icon(
                    CarbonIcons.delivery_parcel,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    S.of(context).Orders,
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          OutlinedButton(
            style: ButtonStyle(
              alignment: Alignment.center,
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(color: Colors.grey[200]!, width: 1.2),
              ),
              maximumSize: MaterialStateProperty.all(const Size(104, 80)),
              minimumSize: MaterialStateProperty.all(const Size(104, 80)),
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddressScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    S.of(context).Addresses,
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          OutlinedButton(
            style: ButtonStyle(
              alignment: Alignment.center,
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(color: Colors.grey[200]!, width: 1.2),
              ),
              minimumSize: MaterialStateProperty.all(const Size(104, 80)),
              maximumSize: MaterialStateProperty.all(const Size(104, 80)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GiftCardsScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.card_giftcard_outlined,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    S.of(context).GiftCards,
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
