import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/styles.const.dart';
import 'package:project_one/views/cart/cart_screen.views.dart';
import 'package:project_one/views/success/success_screen.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      appBar: AppBar(
        title: Text("Checkout",
            style: AppStyles.subtitleText.copyWith(color: kBlackColor)),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: kBlackColor),
        centerTitle: true,
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new, color: kBlackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: AppDimensions.getWidth(10),
                right: AppDimensions.getWidth(10),
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(
                  AppDimensions.getHeight(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppDimensions.getHeight(10)),
                  Text(
                    "Delivery Type",
                    style: AppStyles.subtitleText
                        .copyWith(color: kBlackColor, fontSize: 17),
                  ),
                  SizedBox(height: AppDimensions.getHeight(20)),
                  //home delivery
                  Container(
                    width: AppDimensions.getWidth(130),
                    height: AppDimensions.getHeight(40),
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text("Home Delivery",
                          style: AppStyles.subtitleText
                              .copyWith(color: kPrimaryColor)),
                    ),
                  ),
                  SizedBox(height: AppDimensions.getHeight(10)),
                  Center(
                    child: Text(
                      "Delivery Charges ₹ 70.00",
                      style:
                          AppStyles.subtitleText.copyWith(color: kBlackColor),
                    ),
                  ),
                  SizedBox(height: AppDimensions.getHeight(10)),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.getHeight(10)),
            Container(
              padding: EdgeInsets.all(AppDimensions.getHeight(12)),
              color: kWhiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //add new delivery option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Deliver To",
                        style: AppStyles.subtitleText.copyWith(
                            color: kBlackColor, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Get.snackbar(
                            "Not Available",
                            "Service not availabel",
                            backgroundColor: Colors.green,
                            colorText: kWhiteColor,
                            snackPosition: SnackPosition.TOP,
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              "Add New",
                              style: AppStyles.subtitleText.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: AppDimensions.getHeight(14),
                              ),
                            ),
                            const Icon(Icons.add, color: kPrimaryColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimensions.getHeight(20)),
                  Row(
                    children: [
                      const Icon(Icons.location_pin, color: kPrimaryColor),
                      SizedBox(width: AppDimensions.getWidth(7)),
                      Text(
                        "Others",
                        style: AppStyles.subtitleText.copyWith(
                          color: kBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: AppDimensions.getHeight(10)),
                  //show current location
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sec 20 , Old kalka Ambala Rd, Dhakoli, Haryana 160104, india",
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.subtitleText.copyWith(fontSize: 12),
                      ),
                      const Icon(Icons.arrow_drop_down, color: kBlackColor),
                    ],
                  ),
                  SizedBox(height: AppDimensions.getHeight(20)),
                  //form section
                  TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kLightGreyColor,
                        ),
                      ),
                      filled: true,
                      fillColor: kWhiteColor,
                      labelText: "Street Number",
                      hintText: "Ex: 24th Street",
                      labelStyle: const TextStyle(color: kLightGreyColor),
                    ),
                  ),

                  SizedBox(height: AppDimensions.getHeight(10)),
                  TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kLightGreyColor,
                        ),
                      ),
                      filled: true,
                      fillColor: kWhiteColor,
                      labelText: "House / Floor Number",
                      hintText: "Ex: 24th Street",
                      labelStyle: const TextStyle(color: kLightGreyColor),
                    ),
                  ),
                  SizedBox(height: AppDimensions.getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Promo Code",
                        style: AppStyles.subtitleText.copyWith(
                            color: kBlackColor, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Get.snackbar(
                            "Not Available",
                            "Coupons not availabel",
                            backgroundColor: Colors.green,
                            colorText: kWhiteColor,
                            snackPosition: SnackPosition.TOP,
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              "Add Voucher",
                              style: AppStyles.subtitleText.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: AppDimensions.getHeight(14),
                              ),
                            ),
                            const Icon(Icons.add, color: kPrimaryColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimensions.getHeight(10)),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.getHeight(20)),

            //payment Options
            Container(
              padding: EdgeInsets.all(AppDimensions.getHeight(12)),
              color: kWhiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose Payment Method",
                    style: AppStyles.subtitleText.copyWith(
                        color: kBlackColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: AppDimensions.getHeight(20)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        const PaymentCardWidget(
                            icons: Icons.money,
                            text: "Cash on Delivery",
                            borderColor: kPrimaryColor),
                        SizedBox(width: AppDimensions.getWidth(50)),
                        const PaymentCardWidget(
                            icons: Icons.book_online, text: "Digital Payment"),
                      ],
                    ),
                  ),
                  SizedBox(height: AppDimensions.getHeight(20)),
                ],
              ),
            ),

            //Additional note
            Container(
              padding: EdgeInsets.all(AppDimensions.getHeight(12)),
              color: kWhiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Additional Note",
                    style: AppStyles.subtitleText.copyWith(
                        color: kBlackColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: AppDimensions.getHeight(20)),
                  TextFormField(
                    decoration: InputDecoration(
                      helperMaxLines: 7,
                      focusedBorder: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kLightGreyColor,
                        ),
                      ),
                      filled: true,
                      fillColor: kWhiteColor,
                      labelText: "Additional",
                      hintText: "Please Provide Extra napkin",
                      labelStyle: const TextStyle(color: kLightGreyColor),
                    ),
                  ),
                  SizedBox(height: AppDimensions.getHeight(30)),
                  const ReusableRowTextAndPriceWidget(
                      title: "Subtotal", price: "₹ 400.00"),
                  SizedBox(height: AppDimensions.getHeight(10)),
                  const ReusableRowTextAndPriceWidget(
                      title: "Discount", price: "₹ 60.00"),
                  SizedBox(height: AppDimensions.getHeight(10)),
                  const ReusableRowTextAndPriceWidget(
                      title: "Vat/Tax", price: "₹ 25.00"),
                  SizedBox(height: AppDimensions.getHeight(10)),
                  const ReusableRowTextAndPriceWidget(
                      title: "Delivery Man Tips", price: "₹ 40.00"),
                  SizedBox(height: AppDimensions.getHeight(10)),
                  const ReusableRowTextAndPriceWidget(
                      title: "Delivery Fee", price: "₹ 120.00"),
                  SizedBox(height: AppDimensions.getHeight(10)),
                  const Divider(color: kLightGreyColor, thickness: 2),
                  SizedBox(height: AppDimensions.getHeight(10)),
                  const ReusableRowTextAndPriceWidget(
                    title: "Total Amount",
                    price: "₹ 675.00",
                    headColor: kPrimaryColor,
                    textColor: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () => Get.to(() => const SuccessScreen()),
        child: Container(
          margin: EdgeInsets.all(AppDimensions.getHeight(12)),
          height: AppDimensions.getHeight(50),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(
              AppDimensions.getHeight(15),
            ),
          ),
          child: Center(
            child: Text(
              "Confirm Order",
              style: AppStyles.subtitleText.copyWith(
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentCardWidget extends StatelessWidget {
  const PaymentCardWidget({
    super.key,
    required this.icons,
    required this.text,
    this.borderColor = kLightGreyColor,
  });
  final IconData icons;
  final String text;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.getHeight(60),
      width: AppDimensions.getWidth(210),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 3),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icons),
            SizedBox(width: AppDimensions.getWidth(10)),
            Text(text)
          ],
        ),
      ),
    );
  }
}
