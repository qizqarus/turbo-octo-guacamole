import 'package:flutter/material.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/features/home/widgets/brands_section_widget.dart';
import 'package:home_by_nb/features/home/widgets/search_bar_widget.dart';
import 'package:home_by_nb/features/main/main_screen.dart';
import 'package:home_by_nb/features/search/widgets/category_item.dart';
import 'package:home_by_nb/features/search/widgets/section_tile.dart';
import 'package:home_by_nb/generated/l10n.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Image.asset(
            'assets/app/nblogo.png',
            height: 30,
            width: 78,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const SearchBarWidget(),
                  const SizedBox(height: 20),
                  const BrandSectionWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: AppButton(
                      height: 48,
                      text: S.of(context).SeeAll,
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                      isOutlined: true,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SectionTileWidget(title: S.of(context).Popular),
                  const SizedBox(height: 5),
                  CategoryItemWidget(title: S.of(context).Shares),
                  CategoryItemWidget(title: S.of(context).Sets),
                  CategoryItemWidget(title: S.of(context).ForChristmas),
                  CategoryItemWidget(title: S.of(context).ForChildren),
                  CategoryItemWidget(title: S.of(context).Merch),
                  const SizedBox(height: 12.0),
                  SectionTileWidget(title: S.of(context).Category),
                  const SizedBox(height: 5),
                  CategoryItemWidget(title: S.of(context).Household),
                  CategoryItemWidget(title: S.of(context).ForBeauty),
                  CategoryItemWidget(title: S.of(context).Smells),
                  CategoryItemWidget(title: S.of(context).FoodProducts),
                  CategoryItemWidget(title: S.of(context).ForHome),
                  CategoryItemWidget(title: S.of(context).Scooters),
                  CategoryItemWidget(title: S.of(context).Flowers),
                  CategoryItemWidget(title: S.of(context).ForCar),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
