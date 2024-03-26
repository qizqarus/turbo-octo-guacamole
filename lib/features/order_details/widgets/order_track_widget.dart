import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:home_by_nb/core/components/custom_button.dart';
import 'package:home_by_nb/core/components/text_app.dart';
import 'package:home_by_nb/core/utils/colors.dart';

class OrderTrackingWidget extends StatelessWidget {
  const OrderTrackingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: ListTile(
            leading: const Icon(
              CarbonIcons.delivery,
              color: Colors.black,
            ),
            title: const AppText(
                text: "Order tracking",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey8),
            tileColor: AppColors.grey1,
            trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 400,
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
                              Container(
                                width: 40,
                                height: 5,
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(2.5)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                            text: "Added to cart",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                        Icon(Icons.close),
                                      ],
                                    ),
                                    const SizedBox(height: 10.0),
                                    const AppText(
                                      text:
                                          "To find out the status of your order, enter its ID in the box below and press the "
                                          "Find"
                                          " button. You can find your order ID in the emails you received from us after you created your order.",
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const TextField(
                                      decoration: InputDecoration(
                                        labelStyle: TextStyle(fontSize: 16),
                                        labelText:
                                            'Find the order confirmation in the email',
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.grey8),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.grey2),
                                        ),
                                        floatingLabelStyle:
                                            TextStyle(color: AppColors.grey8),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    const TextField(
                                      decoration: InputDecoration(
                                        labelText:
                                            'The email address used for payment',
                                        labelStyle: TextStyle(fontSize: 16),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.grey8),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.grey2),
                                        ),
                                        floatingLabelStyle:
                                            TextStyle(color: AppColors.grey8),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1.0),
                                      child: Expanded(
                                        child: AppButton(
                                          text: "Find",
                                          onPressed: () {},
                                          height: 48,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
