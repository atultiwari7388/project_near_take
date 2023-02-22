import 'package:flutter/material.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/images.const.dart';
import 'package:project_one/constants/styles.const.dart';

import '../../constants/dimensions.const.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("My Orders",
              style: AppStyles.subtitleText
                  .copyWith(color: kBlackColor, fontSize: 20)),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: kPrimaryColor,
            labelPadding:
                EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(50)),
            labelColor: kPrimaryColor,
            unselectedLabelColor: kBlackColor,
            labelStyle: AppStyles.subtitleText.copyWith(color: kPrimaryColor),
            tabs: const [
              Tab(text: "Running"),
              Tab(text: "History"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildRunningTabSection(),
            Center(child: Text("Not availabel !")),
          ],
        ),
      ),
    );
  }

  Widget buildRunningTabSection() {
    return Container(
      margin: EdgeInsets.only(
          top: AppDimensions.getHeight(16),
          left: AppDimensions.getWidth(8),
          right: AppDimensions.getWidth(2)),
      width: double.maxFinite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image section
          Container(
            height: AppDimensions.getHeight(60),
            width: AppDimensions.getWidth(60),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage(gulabJamunImg), fit: BoxFit.fill),
            ),
          ),
          SizedBox(width: AppDimensions.getWidth(10)),
          //order id and date time section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppDimensions.getHeight(5)),
              Text("Order ID: #1000097",
                  style: AppStyles.subtitleText.copyWith(
                      color: kBlackColor,
                      fontSize: AppDimensions.getHeight(13))),
              SizedBox(height: AppDimensions.getHeight(5)),
              Text("21 Feb 2023 14:58",
                  style: AppStyles.subtitleText
                      .copyWith(fontSize: AppDimensions.getWidth(12))),
            ],
          ),
          const Spacer(),
          //status section
          Column(
            children: [
              //pending or confirmed
              Container(
                height: AppDimensions.getHeight(30),
                width: AppDimensions.getWidth(66),
                decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.13),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Pending",
                    style: AppStyles.subtitleText.copyWith(
                      color: kPrimaryColor,
                      fontSize: AppDimensions.getHeight(12),
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppDimensions.getHeight(5)),
              // track orders
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kPrimaryColor)),
                padding: EdgeInsets.only(
                  left: AppDimensions.getWidth(5),
                  right: AppDimensions.getWidth(5),
                  bottom: AppDimensions.getHeight(3),
                  top: AppDimensions.getHeight(3),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.add_shopping_cart_outlined,
                        color: kPrimaryColor),
                    Text(
                      "Track Order",
                      style: AppStyles.subtitleText
                          .copyWith(color: kPrimaryColor, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: AppDimensions.getWidth(10)),
        ],
      ),
    );
  }
}
