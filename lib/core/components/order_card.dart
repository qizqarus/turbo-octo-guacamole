import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/features/main/main_screen.dart';

class OrderCard extends StatelessWidget {
  final String date;
  final String status;
  final double price;
  final String productName;
  final String productImage;
  final VoidCallback onDeactivate;

  const OrderCard({
    super.key,
    required this.date,
    required this.status,
    required this.price,
    required this.productName,
    required this.productImage,
    required this.onDeactivate,
  });

  Color getStatusColor(String status) {
    switch (status) {
      case 'Canceled':
        return Colors.orange[500]!;
      case 'Paid':
        return Colors.green[500]!;
      case 'Unpaid':
        return Colors.red[500]!;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      color: const Color.fromARGB(245, 255, 255, 255),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (status == 'Canceled' ||
                          status == 'Paid' ||
                          status == 'Unpaid') ...[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              status,
                              style: TextStyle(
                                color: getStatusColor(status),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            date,
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          const TextSpan(text: '€ '),
                          TextSpan(
                            text: '$price',
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: RichText(
                        text: TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Show detail',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.black),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  if (status == 'Unpaid') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainScreen()),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainScreen()),
                                    );
                                  }
                                },
                            ),
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () {},
                                child: const Icon(Icons.chevron_right_outlined,
                                    size: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                if (status == "Unpaid") ...[
                  const SizedBox(height: 45),
                  Expanded(
                    child: AppButton(
                      text: "Pay",
                      onPressed: () {
                        _showConfirmationDialog(context, "cancel");
                      },
                      height: 40,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppButton(
                      text: "Cancel",
                      textColor: Colors.black,
                      backgroundColor: Colors.transparent,
                      height: 40,
                      onPressed: () {
                        _showConfirmationDialog(context, "cancel");
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 48.0,
                        height: 48.0,
                        child: Image.network(productImage, fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          productName,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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

  void _showConfirmationDialog(BuildContext context, String action) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          content: Text(
            "Are you sure you want to cancel order?",
            style:
                GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            AppButton(
              fontSize: 14,
              text: "Yes",
              width: 90,
              textColor: Colors.black,
              backgroundColor: Colors.transparent,
              onPressed: () {
                Navigator.of(context).pop();
                if (action == "pay") {
                } else if (action == "cancel") {}
              },
            ),
            AppButton(
              text: "No",
              fontSize: 14,
              width: 90,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
