import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/styles.const.dart';
import 'package:project_one/controllers/cart_controller.dart';
import 'package:project_one/views/checkout/checkout_screen.dart';

import '../../constants/dimensions.const.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Cart Screen",
            style: AppStyles.subtitleText
                .copyWith(color: kBlackColor, fontSize: 20)),
        centerTitle: true,
      ),
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (value) {
          return Container(
            margin: EdgeInsets.all(AppDimensions.getHeight(12)),
            child: Column(
              children: [
                //product section
                Container(
                  padding: EdgeInsets.all(AppDimensions.getHeight(10)),
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Container(height: 50, width: 60, color: kPrimaryColor),
                      SizedBox(width: AppDimensions.getWidth(10)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Meat Pizza"),
                          //rating section
                          Text("₹ 400.00"),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Container(
                            height: AppDimensions.getHeight(30),
                            width: AppDimensions.getWidth(75),
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "Non-Veg",
                                style: AppStyles.subtitleText.copyWith(
                                  color: kWhiteColor,
                                  fontSize: AppDimensions.getHeight(12),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: AppDimensions.getHeight(5)),
                          Row(
                            children: [
                              ReusableIncrementAndDecrementWidget(
                                onTap: () => value.decrement(),
                                text: "-",
                              ),
                              SizedBox(width: AppDimensions.getWidth(10)),
                              Text(value.x.toString()),
                              SizedBox(width: AppDimensions.getWidth(10)),
                              ReusableIncrementAndDecrementWidget(
                                onTap: () => value.increment(),
                                text: "+",
                                backgroundColor: kPrimaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppDimensions.getHeight(20)),
                //price and item section
                const ReusableRowTextAndPriceWidget(
                    title: "Item Price", price: "₹ 400.00"),
                SizedBox(height: AppDimensions.getHeight(10)),
                const ReusableRowTextAndPriceWidget(
                    title: "Addons", price: "₹ 0.00"),
                SizedBox(height: AppDimensions.getHeight(10)),
                const Divider(color: kGreyColor, thickness: 2),
                SizedBox(height: AppDimensions.getHeight(10)),
                const ReusableRowTextAndPriceWidget(
                    title: "Subtotal", price: "₹ 400.00"),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: InkWell(
        onTap: () => Get.to(() => const CheckOutScreen()),
        child: Container(
          margin: EdgeInsets.only(
              left: AppDimensions.getWidth(15),
              right: AppDimensions.getWidth(15),
              bottom: AppDimensions.getHeight(16)),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(AppDimensions.getWidth(12)),
          ),
          height: AppDimensions.getHeight(48),
          width: double.maxFinite,
          child: Center(
            child: Text(
              "Procced to checkout",
              style: AppStyles.subtitleText.copyWith(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: AppDimensions.getHeight(19)),
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableIncrementAndDecrementWidget extends StatelessWidget {
  const ReusableIncrementAndDecrementWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.backgroundColor = kLightGreyColor,
  });
  final String text;
  final Function() onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppDimensions.getHeight(30),
        width: AppDimensions.getWidth(30),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text,
            style: AppStyles.subtitleText.copyWith(
                fontSize: AppDimensions.getHeight(25), color: kWhiteColor),
          ),
        ),
      ),
    );
  }
}

class ReusableRowTextAndPriceWidget extends StatelessWidget {
  const ReusableRowTextAndPriceWidget({
    super.key,
    required this.title,
    required this.price,
    this.textColor = kLightGreyColor,
    this.headColor = kBlackColor,
  });

  final String title;
  final String price;
  final Color textColor, headColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppStyles.subtitleText.copyWith(color: headColor)),
        Text(price,
            style: AppStyles.subtitleText
                .copyWith(color: textColor, fontSize: 14)),
      ],
    );
  }
}
