import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/order_card.dart';
import 'package:home_by_nb/features/order_track/views/order_track_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  OrdersScreenState createState() => OrdersScreenState();
}

class OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Orders',
            style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListTile(
                leading: const Icon(CarbonIcons.delivery, color: Colors.black),
                title: Text(
                  'Order tracking',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                tileColor: Colors.grey[100],
                trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderTrackScreen(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: OrderCard(
                date: "November 10, 2023",
                status: "Canceled",
                price: 23.25,
                productName:
                    "IDC INSTITUTE bath set Mandarin&Grapefruit (shower gel, bo...",
                productImage: 'assets/products/bath.png',
                onDeactivate: () {},
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: OrderCard(
                date: "December 25, 2023",
                status: "Paid",
                price: 23.25,
                productName:
                    "IDC INSTITUTE bath set Mandarin&Grapefruit (shower gel, bo...",
                productImage: 'assets/products/croco.png',
                onDeactivate: () {},
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: OrderCard(
                date: "January 5, 2023",
                status: "Unpaid",
                price: 50.02,
                productName:
                    "IDC INSTITUTE bath set Mandarin&Grapefruit (shower gel, bo...",
                productImage: 'assets/products/bath.png',
                onDeactivate: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
