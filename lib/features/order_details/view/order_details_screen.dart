import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/text_app.dart';
import 'package:home_by_nb/features/home/views/home_screen.dart';
import 'package:home_by_nb/features/order_details/widgets/order_info_widget.dart';
import 'package:home_by_nb/features/order_details/widgets/order_product_widget.dart';
import 'package:home_by_nb/features/order_details/widgets/order_track_widget.dart';
import 'package:home_by_nb/features/profile/widgets/authorized_contact_section.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const AppText(
          text: "Order detail",
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 17),
            child: AppText(
              text: "In progress",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          const OrderInfoWidget(),
          const SizedBox(height: 10.0),
          const OrderTrackingWidget(),
          const SizedBox(height: 20),
          const OrderProductListWidget(),
          const SizedBox(height: 15.0),
          ListTile(
            title: const AppText(
              text: "Returns and warranty",
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          const SizedBox(height: 30),
          const AuthorizedContactSection(),
          const SizedBox(height: 20),
          Text(
            "I - F 09:00h - 17:00hVI 10:00h - 14:00h",
            style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }
}

class MainPage {}
