import 'package:flutter/material.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/features/home/widgets/brands_section_widget.dart';
import 'package:home_by_nb/features/home/widgets/home_page_carousel_widget.dart';
import 'package:home_by_nb/features/home/widgets/top_product_section_widget.dart';
import 'package:home_by_nb/features/home/widgets/widget.dart';
import 'package:home_by_nb/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imgList = [
    'wysiwyg/codazon/homebynb/home-banner1.png',
    'wysiwyg/codazon/homebynb/home-banner2.png',
    'wysiwyg/codazon/homebynb/home-banner3.png',
    'wysiwyg/codazon/homebynb/home-banner4.png',
    'wysiwyg/codazon/homebynb/home-banner5.png',
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
                  HomePageCarouselWidget(imgList: imgList),
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
                  TopProductSectionWidget(title: S.of(context).TopProducts),
                  TopProductSectionWidget(title: S.of(context).NewProducts),
                  TopProductSectionWidget(title: S.of(context).RecentlyViewed),
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
