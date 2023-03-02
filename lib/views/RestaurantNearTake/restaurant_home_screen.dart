import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/styles.const.dart';
import 'package:project_one/views/RestaurantNearTake/order_details_screen.dart';
import 'package:project_one/views/RestaurantNearTake/restaurant_notification_screen.dart';

class RestaurantHomeScreen extends StatefulWidget {
  const RestaurantHomeScreen({super.key});

  @override
  State<RestaurantHomeScreen> createState() => _RestaurantHomeScreenState();
}

class _RestaurantHomeScreenState extends State<RestaurantHomeScreen>
    with TickerProviderStateMixin {
  bool isRestaurantClosed = false;
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: Text(
          "Near Take Restaurant",
          style:
              AppStyles.subtitleText.copyWith(color: kBlackColor, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(
              () => const RestaurantNotificationScreen(),
            ),
            icon: const Icon(Icons.notifications, color: kBlackColor),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: AppDimensions.getWidth(8),
          right: AppDimensions.getWidth(8),
          top: AppDimensions.getHeight(16),
        ),
        child: Column(
          children: [
            //top section
            buildTopSection(),
            SizedBox(height: AppDimensions.getHeight(20)),
            //card section
            buildCardSection(context),
            // row data section
            SizedBox(height: AppDimensions.getHeight(20)),
            //custom tabs
            Container(
              decoration: BoxDecoration(
                color: kWhiteColor,
                border: Border.all(color: kLightGreyColor),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: kPrimaryColor,
                ),
                controller: tabController,
                unselectedLabelColor: kDarkGreyColor,
                labelStyle: AppStyles.subtitleText,
                unselectedLabelStyle: AppStyles.subtitleText.copyWith(),
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.getWidth(10)),
                tabs: const [
                  Tab(text: "Pending(0)"),
                  Tab(text: "Confirm(1)"),
                  Tab(text: "Cooking(0)"),
                  Tab(text: "Ready for Deliver(0)"),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.getHeight(10)),
            //custom tab data

            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (_, index) {
                      return const Center(child: Text("No Data found"));
                    },
                  ),
                  Center(
                    child: InkWell(
                      onTap: () => Get.to(() => const OrderDetailsResScreen()),
                      child: const Text("View Order"),
                    ),
                  ),
                  const Center(child: Text("No Data found")),
                  const Center(child: Text("No Data found")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//====================  Card Section  ================================

  Widget buildCardSection(BuildContext context) {
    return Container(
      height: AppDimensions.getHeight(200),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(AppDimensions.getHeight(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //wallet and earning section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.googleWallet,
                  color: kWhiteColor, size: AppDimensions.getHeight(50)),
              SizedBox(width: AppDimensions.getWidth(15)),
              Column(
                children: [
                  Text(
                    "Today",
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
          SizedBox(height: AppDimensions.getHeight(30)),
          //week and month earning
          Padding(
            padding: EdgeInsets.only(
              left: AppDimensions.getWidth(8),
              right: AppDimensions.getWidth(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "This Week",
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
                Text(
                  "|",
                  style: AppStyles.subtitleText.copyWith(
                    color: kWhiteColor,
                    fontSize: AppDimensions.getHeight(40),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "This Month",
                      style: AppStyles.subtitleText.copyWith(
                          color: kWhiteColor,
                          fontSize: AppDimensions.getHeight(17),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹ 2,455.65",
                      style: AppStyles.subtitleText.copyWith(
                          color: kWhiteColor,
                          fontSize: AppDimensions.getHeight(16),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//====================  Top Section  ==================================

  Widget buildTopSection() {
    return Container(
      padding: EdgeInsets.all(AppDimensions.getHeight(8)),
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Restaurant Temporarily Closed",
            style: AppStyles.subtitleText
                .copyWith(fontSize: 16, color: kBlackColor),
          ),
          Switch(
              value: isRestaurantClosed,
              onChanged: (vallue) {
                setState(() {
                  isRestaurantClosed = vallue;
                });
              }),
        ],
      ),
    );
  }
}
