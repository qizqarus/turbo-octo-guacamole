import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/custom_button.dart';

class ActiveCardStock extends StatelessWidget {
  final String date;
  final String status;
  final int id;
  final int waiting;
  final String productName;
  final String productImage;
  final VoidCallback onDeactivate;

  const ActiveCardStock({
    super.key,
    required this.date,
    required this.status,
    required this.id,
    required this.waiting,
    required this.productName,
    required this.productImage,
    required this.onDeactivate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        date,
                        style: GoogleFonts.roboto(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      if (status == 'Out of stock') ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
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
                                color: Colors.orange[500],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          const TextSpan(text: 'ID: '),
                          TextSpan(
                            text: '#$id',
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Waiting: '),
                          TextSpan(
                            text: '$waiting val',
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: AppButton(
              text: 'Deactivate',
              onPressed: onDeactivate,
              textColor: Colors.white,
              borderRadius: 5.0,
              isOutlined: false,
              height: 50,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 8.0),
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
}
