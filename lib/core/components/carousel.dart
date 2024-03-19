// ignore_for_file: library_private_types_in_public_api

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCarousel extends StatefulWidget {
  final List<String> imgList;
  final double? width;
  final double? height;

  const MyCarousel({
    super.key,
    required this.imgList,
    this.width = 350,
    this.height = 260,
  });

  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          CarouselSlider(
            items: widget.imgList
                .map((item) => SizedBox(
                      width: widget.width,
                      height: widget.height,
                      child: Center(
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imgList.asMap().entries.map((entry) {
              int index = entry.key;
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
                decoration: BoxDecoration(
                  color: _current == index
                      ? const Color.fromRGBO(0, 0, 0, 0.9)
                      : const Color.fromRGBO(212, 212, 212, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const SizedBox(
                  width: 14.0,
                  height: 4.0,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
