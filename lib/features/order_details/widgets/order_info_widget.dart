import 'package:flutter/material.dart';
import 'package:home_by_nb/core/components/text_app.dart';
import 'package:home_by_nb/core/utils/colors.dart';

class OrderInfoWidget extends StatelessWidget {
  const OrderInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey1,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4),
                color: AppColors.grey0,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        AppText(
                          text: "Order ID",
                          fontSize: 14,
                          color: AppColors.grey8,
                        ),
                        Spacer(),
                        AppText(
                          text: "REXFL7",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey8,
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        AppText(
                          text: "Date",
                          fontSize: 14,
                          color: AppColors.grey8,
                        ),
                        Spacer(),
                        AppText(
                          text: "25/12/2023",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey8,
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        AppText(
                          text: "Products",
                          fontSize: 14,
                          color: AppColors.grey8,
                        ),
                        Spacer(),
                        AppText(
                          text: "1 item",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey8,
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        AppText(
                          text: "Delivery",
                          fontSize: 14,
                          color: AppColors.grey8,
                        ),
                        AppText(
                          text: "(via DPD home courier)",
                          fontSize: 12,
                          color: AppColors.grey5,
                        ),
                        Spacer(),
                        AppText(
                          text: "€ 3.58",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey8,
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        AppText(
                          text: "Express delivery",
                          fontSize: 14,
                          color: AppColors.grey8,
                        ),
                        Spacer(),
                        AppText(
                          text: "€ 5",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey8,
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        AppText(
                          text: "Payment methods",
                          fontSize: 14,
                          color: AppColors.grey8,
                        ),
                        Spacer(),
                        AppText(
                          text: "Pay by card",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey8,
                        )
                      ],
                    ),
                    Container(
                      height: 2,
                      margin: const EdgeInsets.only(top: 10, bottom: 16),
                      decoration: const BoxDecoration(
                        color: AppColors.grey2,
                        borderRadius: BorderRadius.all(Radius.circular(2.5)),
                      ),
                    ),
                    const Row(
                      children: [
                        AppText(
                          text: "Total",
                          fontSize: 14,
                          color: AppColors.grey8,
                        ),
                        AppText(
                          text: "(€ 4.12 VAT included)",
                          fontSize: 12,
                          color: AppColors.grey5,
                        ),
                        Spacer(),
                        AppText(
                          text: "€ 24.56",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey8,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
