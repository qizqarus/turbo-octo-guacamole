import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/core/components/custom_input.dart';

class OrderTrackScreen extends StatelessWidget {
  const OrderTrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Order tracking',
            style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'To find out the status of your order, enter its ID in the box below and press the "Find" button. You can find your order ID in the emails you received from us after you created your order.',
                    style: GoogleFonts.roboto(
                      color: Colors.grey[800],
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const CustomTextField(
                labelText: 'Find the order confirmation in the email'),
            const SizedBox(
              height: 12,
            ),
            const CustomTextField(
                labelText: 'The email address used for payment'),
            const SizedBox(height: 20),
            AppButton(
              text: 'Find',
              onPressed: () {},
              textColor: Colors.white,
              borderRadius: 5.0,
              isOutlined: false,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
