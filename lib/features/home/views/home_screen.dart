import 'package:flutter/material.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/features/home/widgets/brands_section_widget.dart';
import 'package:home_by_nb/features/home/widgets/widget.dart';
import 'package:home_by_nb/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imgList = [
    'assets/banners/fourth.png',
    'assets/banners/second.png',
    'assets/banners/third.png',
    'assets/app/first.png'
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/app/nblogo.png',
          height: 30,
          width: 78,
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const SearchBarWidget(),
                  CarouselWidget(imgList: imgList),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: AppButton(
                      text: S.of(context).OffersMonth,
                      onPressed: () => {
                        Navigator.of(context).pushNamed('/offer'),
                      },
                      height: 48,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const PersonalSectionWidget(),
                  ProductSectionWidget(title: S.of(context).TopProducts),
                  ProductSectionWidget(title: S.of(context).NewProducts),
                  ProductSectionWidget(title: S.of(context).RecentlyViewed),
                  const BrandSectionWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
