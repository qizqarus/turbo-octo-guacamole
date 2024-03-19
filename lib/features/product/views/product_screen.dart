import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/features/home/widgets/carousel_widget.dart';
import 'package:home_by_nb/features/home/widgets/product_card_widget.dart';
import 'package:home_by_nb/features/product/widgets/product_modal.dart';
import 'package:home_by_nb/features/product_list/views/product_list_screen.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final List<String> imgList = [
    'assets/products/bath.png',
    'assets/products/croco.png',
    'assets/products/croco.png',
    'assets/products/croco.png',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.share_outlined,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.star_outline_outlined,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselWidget(
                imgList: imgList,
                height: 550,
                width: 550,
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'IDC INSTITUTE bath set Mandarin&Grapefruit (shower gel, body lotion)',
                  textAlign: TextAlign.center,
                  style: theme.bodySmall,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '€ 7.99 ',
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.lineThrough),
                  ),
                  Text(
                    '  -10% ',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    ' € 7.59',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: AppButton(
                  text: "Add to cart",
                  onPressed: () {
                    const ProductModal().show(context);
                  },
                  textColor: Colors.white,
                  borderRadius: 5.0,
                  isOutlined: false,
                  height: 48,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(color: Colors.grey[200]!, width: 2.0),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Buy two products and save 5%",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(color: Colors.grey[200]!, width: 2.0),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Buy three products and save 5%",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: Theme(
                  data: ThemeData(
                    highlightColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    title: Text(
                      "Description",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          'An interestingly designed kit for body skin care. Perfect as a gift for any occasion. Cosmetic products never go out of fashion, and the decoration in the set can become a great interior detail.\n\nIn the set:\n• Shower gel - 100 ml\n• Body lotion - 50 ml',
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Theme(
                data: ThemeData(
                  highlightColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  title: Text(
                    "Additional information",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "An interestingly designed kit for body skin care. Perfect as a gift for any occasion. Cosmetic products never go out of fashion, and the decoration in the set can become a great interior detail.",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.grey[500],
                      size: 17,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Free delivery throughout Lithuania from €50!",
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              _wishlistSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _wishlistSection(BuildContext context) {
    return _productSection(
      context,
      'Similar products',
      'assets/products/croco.png',
    );
  }

  TextStyle _textStyle(double fontSize, FontWeight fontWeight, {Color? color}) {
    return GoogleFonts.roboto(
      color: color ?? Colors.black,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  Widget _productSection(BuildContext context, title, String imageUrl,
      {String? oldPrice}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: _textStyle(18, FontWeight.w500)),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: ProductCardWidget(
                    title: 'Donut for keys',
                    price: '10.50',
                    oldPrice: '29.00',
                    imageUrl: 'assets/products/croco.png',
                    discount: 20,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AppButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductListScreen()),
              );
            },
            text: 'Shop now',
            backgroundColor: Colors.white,
            isOutlined: true,
            textColor: Colors.black,
            height: 48,
          ),
        ],
      ),
    );
  }
}
