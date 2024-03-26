// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/active_card_stock.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/core/components/custom_input.dart';
import 'package:home_by_nb/core/components/my_activity_card_stock.dart';

class GiftCardsScreen extends StatefulWidget {
  const GiftCardsScreen({super.key});

  @override
  _GiftCardsScreenState createState() => _GiftCardsScreenState();
}

class _GiftCardsScreenState extends State<GiftCardsScreen>
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Gift cards',
          style: GoogleFonts.roboto(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Container(
                  color: Colors.grey[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Your balance',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '€0.00',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Add a gift card?',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Expanded(
                        child: CustomTextField(
                          labelText: "Enter code",
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 70,
                        height: 48,
                        child: AppButton(
                          iconSize: 20,
                          text: "Add",
                          borderColor: Colors.black,
                          borderRadius: 4,
                          isOutlined: true,
                          onPressed: () => {},
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Active Gift Card'),
                  Tab(text: 'Activity'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
        Tab(text: 'Active gift cards'),
        Tab(text: 'Activity'),
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
      ],
    );
  }
}
