// ignore_for_file: unused_element

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/features/product/widgets/carousel_widget.dart';
import 'package:home_by_nb/features/home/widgets/top_product_section_widget.dart';
import 'package:home_by_nb/features/product/widgets/product_modal.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatelessWidget {
  final String? productSKU;

  const ProductScreen({super.key, this.productSKU});

  Future<Map<String, dynamic>> fetchData() async {
    var response = await http.get(Uri.parse(
        'https://magento-1194376-4209178.cloudwaysapps.com/index.php/rest/V1/products/$productSKU'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load product data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          String shortDescription = "";
          String longDescription = "";
          List<dynamic> customAttributes = snapshot.data?['custom_attributes'];
          for (var attribute in customAttributes) {
            if (attribute['attribute_code'] == 'short_description') {
              shortDescription = attribute['value'];
            } else if (attribute['attribute_code'] == 'description') {
              longDescription = attribute['value'];
            }
          }
          List<dynamic> mediaGalleryEntries =
              snapshot.data?['media_gallery_entries'];
          List<String> imgList = mediaGalleryEntries
              .map<String>((entry) => entry['file'] as String)
              .toList();
          String productName = snapshot.data?['name'];
          double price = (snapshot.data?['price']).toDouble();
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
                        productName,
                        textAlign: TextAlign.center,
                        style: theme.bodySmall,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '€ ${price.toString()}',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        // Text(
                        //   '  -10% ',
                        //   style: GoogleFonts.roboto(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.w400,
                        //     color: Colors.grey[500],
                        //   ),
                        // ),
                        // Text(
                        //   ' € 7.59',
                        //   style: GoogleFonts.roboto(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.w700,
                        //     color: Colors.red,
                        //   ),
                        // ),
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
                                  BorderSide(
                                      color: Colors.grey[200]!, width: 2.0),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
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
                                  BorderSide(
                                      color: Colors.grey[200]!, width: 2.0),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                shortDescription,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              longDescription,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 10),
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
                    const TopProductSectionWidget(title: "Similar products"),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
