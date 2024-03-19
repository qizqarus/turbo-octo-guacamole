import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Text(
            "Pay with",
            style: GoogleFonts.roboto(),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              buildButton(Icons.account_balance_wallet, onPressed: () {}),
              buildButton(Icons.credit_card, onPressed: () {}),
              buildImageButton("assets/app/klix.png", onPressed: () {}),
              buildImageButton("assets/app/paypal.png", onPressed: () {}),
            ],
          ),
        ),
        const SizedBox(height: 12.0), // Added SizedBox for spacing
        Expanded(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/app/klix.png'),
                ),
                title: Text('Item $index'),
                trailing: Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildButton(IconData icon, {required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          size: 24.0,
        ),
      ),
    );
  }

  Widget buildImageButton(String imagePath, {required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Image.asset(
          imagePath,
          width: 24.0,
          height: 24.0,
        ),
      ),
    );
  }
}
