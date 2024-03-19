import 'package:flutter/material.dart';
import 'package:home_by_nb/core/components/custom_button.dart';

class ProductModal extends StatelessWidget {
  const ProductModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void show(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: 40,
                      height: 5,
                      margin: const EdgeInsets.only(top: 10, bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(2.5)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Added to cart',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 130,
                                width: 130,
                                child: Image.asset('assets/products/croco.png'),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              const Text(
                                'IDC INSTITUTE bath set\n Mandarin&Grapefruit\n (shower gel, body lotion)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '€7.99 ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: '-10% ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    TextSpan(
                                      text: '€7.59',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: AppButton(
                          text: 'Go to cart',
                          onPressed: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                        )),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
