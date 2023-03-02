import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants/app_colors.constants.dart';
import '../../constants/dimensions.const.dart';
import '../../constants/styles.const.dart';

class RestaurantEarningScreen extends StatelessWidget {
  const RestaurantEarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wallet",
          style: AppStyles.subtitleText.copyWith(
            color: kBlackColor,
            fontSize: AppDimensions.getHeight(18),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.getWidth(8),
            right: AppDimensions.getWidth(8),
            top: AppDimensions.getHeight(16),
          ),
          child: Column(
            children: [
              //card top  Section
              buildCardTopSection(context),
              SizedBox(height: AppDimensions.getHeight(20)),
              //second card section
              Row(
                children: [
                  const Expanded(
                    child: ReusableRestaurantCardWidget(
                        firstText: "₹ 8,378,00",
                        secondText: "Pending Withdraw"),
                  ),
                  SizedBox(width: AppDimensions.getWidth(10)),
                  const Expanded(
                    child: ReusableRestaurantCardWidget(
                        firstText: "₹ 0.00", secondText: "Withdrawn"),
                  ),
                ],
              ),
              SizedBox(height: AppDimensions.getHeight(20)),
              Row(
                children: [
                  const Expanded(
                    child: ReusableRestaurantCardWidget(
                        firstText: "₹ 733.23",
                        secondText: "Collect Cash from Customer"),
                  ),
                  SizedBox(width: AppDimensions.getWidth(10)),
                  const Expanded(
                    child: ReusableRestaurantCardWidget(
                        firstText: "₹ 9,111.26", secondText: "Total Earning"),
                  ),
                ],
              ),
              SizedBox(height: AppDimensions.getHeight(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Withdraw History",
                      style: AppStyles.subtitleText.copyWith(
                          color: kBlackColor, fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: () {},
                    child: Text("View All",
                        style: AppStyles.subtitleText
                            .copyWith(color: kPrimaryColor)),
                  ),
                ],
              ),
              SizedBox(height: AppDimensions.getHeight(20)),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "₹ 3,378.07",
                                  style: AppStyles.subtitleText.copyWith(
                                    color: kBlackColor,
                                  ),
                                ),
                                Text(
                                  "Transfered to Bank",
                                  style: AppStyles.subtitleText
                                      .copyWith(fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "24 Feb 2023 12:17",
                                  style: AppStyles.subtitleText
                                      .copyWith(fontSize: 12),
                                ),
                                Text(
                                  "Pending",
                                  style: AppStyles.subtitleText.copyWith(
                                      fontSize: 15, color: kPrimaryColor),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: AppDimensions.getHeight(5)),
                        const Divider(),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

//==================== Top Card Section  ================================

  Widget buildCardTopSection(BuildContext context) {
    return Container(
      height: AppDimensions.getHeight(110),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(AppDimensions.getHeight(10)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: AppDimensions.getWidth(15), top: AppDimensions.getHeight(37)),
        child: Column(
          children: [
            //wallet and earning section
            Row(
              children: [
                FaIcon(FontAwesomeIcons.googleWallet,
                    color: kWhiteColor, size: AppDimensions.getHeight(50)),
                SizedBox(width: AppDimensions.getWidth(15)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Withdrawable Amount",
                      style: AppStyles.subtitleText.copyWith(
                          color: kWhiteColor,
                          fontSize: AppDimensions.getHeight(17),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹ 0.00",
                      style: AppStyles.subtitleText.copyWith(
                          color: kWhiteColor,
                          fontSize: AppDimensions.getHeight(16),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableRestaurantCardWidget extends StatelessWidget {
  const ReusableRestaurantCardWidget({
    Key? key,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  final String firstText, secondText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppDimensions.getWidth(8),
        right: AppDimensions.getWidth(8),
        top: AppDimensions.getHeight(16),
      ),
      height: AppDimensions.getHeight(110),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(AppDimensions.getHeight(10)),
        boxShadow: [
          BoxShadow(
            color: kLightGreyColor.withOpacity(0.3),
            blurRadius: 2.5,
            spreadRadius: 1,
            offset: const Offset(3, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            firstText,
            style: AppStyles.subtitleText.copyWith(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: AppDimensions.getHeight(7)),
          Text(
            secondText,
            textAlign: TextAlign.center,
            style: AppStyles.subtitleText
                .copyWith(fontSize: AppDimensions.getHeight(15)),
          ),
        ],
      ),
    );
  }
}
