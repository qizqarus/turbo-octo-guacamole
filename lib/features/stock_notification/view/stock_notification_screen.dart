// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/active_card_stock.dart';
import 'package:home_by_nb/core/components/my_activity_card_stock.dart';

class StockNotigicationScreen extends StatefulWidget {
  const StockNotigicationScreen({super.key});

  @override
  _StockNotigicationScreenState createState() =>
      _StockNotigicationScreenState();
}

class _StockNotigicationScreenState extends State<StockNotigicationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Stock notification',
            style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      body: Column(
        children: [
          TabBarWidget(
            tabController: _tabController,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ActiveTab(),
                MyActivityTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  final TabController tabController;

  const TabBarWidget({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: const [
        Tab(text: 'Active'),
        Tab(text: 'My activity'),
      ],
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
    );
  }
}

class ActiveTab extends StatelessWidget {
  const ActiveTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ActiveCardStock(
            date: 'December 25, 2023',
            status: 'Out of stock',
            id: 7033,
            waiting: 5,
            productName:
                'IDC INSTITUTE bath set Mandarin&Grapefruit (shower gel, bo...',
            productImage: 'assets/products/croco.png',
            onDeactivate: () {},
          ),
        )
      ],
    );
  }
}

class MyActivityTab extends StatelessWidget {
  const MyActivityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: MyActivityCardStock(
            date: 'December 25, 2023',
            description:
                'Created “IDC INSTITUTE bath set Mandarin&Grapefruit (shower gel, bo...)” notification (#7033)',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: MyActivityCardStock(
            date: 'December 25, 2023',
            description:
                'Delivered “Small Christmas composition No. 4 in a red box” notification (#7033)',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: MyActivityCardStock(
            date: 'December 25, 2023',
            description:
                'Deactivate “Electric scooter Beaster Scooter XWAY, 1000 W, 48 V, 16.6 Ah” notification (#7033)',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: MyActivityCardStock(
            date: 'December 25, 2023',
            description:
                'Created “MANY MORNINGS "Plant Lover" socks” notification (#7033)',
          ),
        )
      ],
    );
  }
}
