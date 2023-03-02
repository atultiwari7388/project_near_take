import 'package:flutter/material.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/styles.const.dart';

class RestaurantBagScreen extends StatefulWidget {
  const RestaurantBagScreen({super.key});

  @override
  State<RestaurantBagScreen> createState() => _RestaurantBagScreenState();
}

class _RestaurantBagScreenState extends State<RestaurantBagScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController controller = TabController(length: 3, vsync: this);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order History",
          style: AppStyles.subtitleText.copyWith(
            color: kBlackColor,
            fontSize: AppDimensions.getHeight(18),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: AppDimensions.getWidth(8),
          right: AppDimensions.getWidth(8),
          top: AppDimensions.getHeight(16),
        ),
        child: Column(
          children: [
            //card Section
            buildCardWidget(context),
            SizedBox(height: AppDimensions.getHeight(20)),
            //tab bar section
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
                controller: controller,
                unselectedLabelColor: kDarkGreyColor,
                dividerColor: kLightGreyColor,
                physics: const BouncingScrollPhysics(),
                labelStyle: AppStyles.subtitleText,
                unselectedLabelStyle: AppStyles.subtitleText.copyWith(),
                isScrollable: false,
                labelPadding:
                    EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(3)),
                tabs: const [
                  Tab(text: "All"),
                  Tab(text: "Delivered"),
                  Tab(text: "Refunded"),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.getHeight(10)),
            //custom tab data

            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 30,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: AppDimensions.getWidth(8),
                          right: AppDimensions.getWidth(8),
                          top: AppDimensions.getHeight(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Order ID: #100096",
                                      style: AppStyles.subtitleText.copyWith(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                        height: AppDimensions.getHeight(5)),
                                    Row(
                                      children: [
                                        Text(
                                          "07 Feb 2023 17:52  | ",
                                          style:
                                              AppStyles.subtitleText.copyWith(
                                            fontSize: AppDimensions.getHeight(
                                              AppDimensions.getHeight(12),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Delivery",
                                          style:
                                              AppStyles.subtitleText.copyWith(
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: AppDimensions.getHeight(
                                                AppDimensions.getHeight(13)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  height: AppDimensions.getHeight(30),
                                  width: AppDimensions.getWidth(80),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Delivered",
                                      style: AppStyles.subtitleText.copyWith(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: AppDimensions.getHeight(13),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppDimensions.getHeight(10)),
                            Divider(
                                color: kLightGreyColor,
                                thickness: AppDimensions.getHeight(1)),
                          ],
                        ),
                      );
                    },
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

  Container buildCardWidget(BuildContext context) {
    return Container(
      height: AppDimensions.getHeight(80),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(AppDimensions.getHeight(10)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: AppDimensions.getWidth(13),
          right: AppDimensions.getWidth(13),
          top: AppDimensions.getHeight(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReusableRestaurantColumnWidget(
                firstText: "Today", secondText: 0.toString()),
            ReusableRestaurantColumnWidget(
                firstText: "This Week", secondText: 0.toString()),
            ReusableRestaurantColumnWidget(
                firstText: "This Month", secondText: 0.toString()),
          ],
        ),
      ),
    );
  }
}

class ReusableRestaurantColumnWidget extends StatelessWidget {
  const ReusableRestaurantColumnWidget(
      {super.key, required this.firstText, required this.secondText});

  final String firstText, secondText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          firstText,
          style: AppStyles.subtitleText.copyWith(
            color: kWhiteColor,
            fontSize: AppDimensions.getHeight(16),
          ),
        ),
        Row(
          children: [
            const Icon(Icons.money, color: kWhiteColor),
            SizedBox(
              width: AppDimensions.getWidth(
                AppDimensions.getHeight(5),
              ),
            ),
            Text(secondText,
                style: AppStyles.subtitleText.copyWith(color: kWhiteColor)),
          ],
        ),
      ],
    );
  }
}
