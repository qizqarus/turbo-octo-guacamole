import 'package:flutter/material.dart';
import 'package:home_by_nb/core/components/buyer_details_card.dart';
import 'package:home_by_nb/core/components/delivery_address_card.dart';
import 'package:home_by_nb/core/components/text_app.dart';
import 'package:home_by_nb/core/utils/colors.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.grey8),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const AppText(
            text: 'Addresses', fontSize: 20, fontWeight: FontWeight.w700),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.info_outlined,
                  color: AppColors.grey5,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: AppText(
                  text: "These addresses will be used on the checkout page.",
                  color: AppColors.grey5,
                  fontSize: 14,
                )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            BuyerDetailCard(),
            SizedBox(
              height: 20,
            ),
            DeliveryAddressCard(
                name: "Henry Jackman",
                address: "Kęstučio g.51, LT-08124",
                country: "Lithuania"),
          ],
        ),
      ),
    );
  }
}
