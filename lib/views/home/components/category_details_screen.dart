import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/styles.const.dart';
import 'package:project_one/views/home/components/restaurant_detail_screen.views.dart';
import 'package:project_one/views/home/home_screen.views.dart';
import 'package:project_one/widgets/global_var.widgets.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: kBlackColor),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: kPrimaryColor,
            labelPadding:
                EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(50)),
            labelColor: kPrimaryColor,
            unselectedLabelColor: kBlackColor,
            labelStyle: AppStyles.subtitleText.copyWith(color: kPrimaryColor),
            tabs: const [
              Tab(text: "Restaurant"),
              Tab(text: "Food"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: Globalvariable.popularRestaurantsItems.length,
              itemBuilder: (_, index) {
                final resData = Globalvariable.popularRestaurantsItems[index];
                return Container(
                  margin: EdgeInsets.only(top: AppDimensions.getHeight(20)),
                  child: RestaurantData(
                    title: resData["name"]!,
                    image: resData["image"]!,
                    onTap: () => Get.to(() => RestaurantDetailsScreen(
                        resImage: resData["image"], title: resData["name"])),
                  ),
                );
              },
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: Globalvariable.popularFoodsItems.length,
              itemBuilder: (_, index) {
                final resData = Globalvariable.popularFoodsItems[index];
                return Container(
                  margin: EdgeInsets.only(top: AppDimensions.getHeight(20)),
                  child: FoodData(
                    title: resData["name"]!,
                    image: resData["image"]!,
                    onTap: () {
                      buildAddToCartBottom(resData);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildAddToCartBottom(Map<String, String> resData) {
    return Get.bottomSheet(
      persistent: false,
      // isScrollControlled: true,
      ignoreSafeArea: true,
      Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //tap to close
            InkWell(
              onTap: () => Get.back(),
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: kPrimaryColor,
                  child: Text(
                    "X",
                    style: AppStyles.subtitleText.copyWith(color: kWhiteColor),
                  ),
                ),
              ),
            ),
            // image section
            Container(
              margin: EdgeInsets.only(left: AppDimensions.getHeight(8)),
              padding: EdgeInsets.only(left: AppDimensions.getWidth(8)),
              // width: AppDimensions.getWidth(280),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  //image section
                  Stack(
                    children: [
                      Container(
                        width: AppDimensions.getWidth(100),
                        height: AppDimensions.getHeight(100),
                        decoration: BoxDecoration(
                            // color: Colors.green,
                            borderRadius: BorderRadius.circular(7),
                            image: DecorationImage(
                                image: AssetImage(resData["image"]!),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        top: AppDimensions.getHeight(15),
                        child: Container(
                          height: AppDimensions.getHeight(20),
                          width: AppDimensions.getWidth(60),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                              topRight:
                                  Radius.circular(AppDimensions.getHeight(10)),
                              bottomRight:
                                  Radius.circular(AppDimensions.getHeight(10)),
                            ),
                          ),
                          child: Center(
                              child: Text("15% Off",
                                  style: AppStyles.subtitleText.copyWith(
                                      color: kWhiteColor, fontSize: 13))),
                        ),
                      ),
                    ],
                  ),
                  //text Section
                  Container(
                    height: AppDimensions.getHeight(120),
                    padding: const EdgeInsets.all(3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableTextWidgetRes(
                            text: resData["name"]!,
                            color: kBlackColor,
                            fontSize: 15),
                        SizedBox(height: AppDimensions.getHeight(5)),
                        ReusableTextWidgetRes(
                            text: "Hungry puppets",
                            color: kDarkGreyColor,
                            fontSize: 15),
                        Padding(
                          padding:
                              EdgeInsets.only(left: AppDimensions.getWidth(7)),
                          child: Row(
                            children: [
                              Row(
                                children: List.generate(
                                    5,
                                    (index) => const Icon(Icons.star,
                                        color: kPrimaryColor, size: 18)),
                              ),
                              SizedBox(width: AppDimensions.getWidth(3)),
                              Text("(12)"),
                            ],
                          ),
                        ),
                        SizedBox(height: AppDimensions.getHeight(5)),
                        //price section
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.indianRupeeSign,
                                  size: 12),
                              Text("120"),
                            ],
                          ),
                        ),
                        //price drop section
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.indianRupeeSign,
                                size: 12,
                                color: kGreyColor,
                              ),
                              Text("120",
                                  style: AppStyles.subtitleText.copyWith(
                                      color: kGreyColor,
                                      decoration: TextDecoration.lineThrough)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //details section
            Flexible(child: Container()),
            //bottom section
            Row(
              children: [
                Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kPrimaryColor),
                  ),
                  child: const Icon(Icons.shopping_cart, color: kPrimaryColor),
                ),
                SizedBox(width: AppDimensions.getWidth(10)),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Order now",
                        style: AppStyles.subtitleText.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kWhiteColor,
                            fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//=============== Restaurant Data  ======================

class RestaurantData extends StatelessWidget {
  const RestaurantData({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
    this.iconColor = kLightGreyColor,
  }) : super(key: key);

  final String title, image;
  final Function() onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppDimensions.getHeight(8)),
        padding: EdgeInsets.only(left: AppDimensions.getWidth(8)),
        // width: AppDimensions.getWidth(280),
        // decoration: BoxDecoration(
        //     color: kWhiteColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            //image section
            Stack(
              children: [
                Container(
                  width: AppDimensions.getWidth(100),
                  height: AppDimensions.getHeight(100),
                  decoration: BoxDecoration(
                      // color: Colors.green,
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
                Positioned(
                  top: AppDimensions.getHeight(15),
                  child: Container(
                    height: AppDimensions.getHeight(20),
                    width: AppDimensions.getWidth(60),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppDimensions.getHeight(10)),
                        bottomRight:
                            Radius.circular(AppDimensions.getHeight(10)),
                      ),
                    ),
                    child: Center(
                        child: Text("15% Off",
                            style: AppStyles.subtitleText
                                .copyWith(color: kWhiteColor, fontSize: 13))),
                  ),
                ),
              ],
            ),
            //text Section
            Expanded(
              child: Container(
                height: AppDimensions.getHeight(100),
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppDimensions.getHeight(10)),
                    ReusableTextWidgetRes(
                        text: title, color: kBlackColor, fontSize: 15),
                    SizedBox(height: AppDimensions.getHeight(5)),
                    const ReusableTextWidgetRes(
                        text: "Hungry puppets",
                        color: kDarkGreyColor,
                        fontSize: 15),
                    SizedBox(height: AppDimensions.getHeight(5)),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimensions.getWidth(7)),
                      child: Row(
                        children: [
                          Row(
                            children: List.generate(
                                5,
                                (index) => const Icon(Icons.star,
                                    color: kPrimaryColor, size: 18)),
                          ),
                          SizedBox(width: AppDimensions.getWidth(3)),
                          Text("(12)"),
                        ],
                      ),
                    ),
                    SizedBox(height: AppDimensions.getHeight(5)),
                  ],
                ),
              ),
            ),
            Icon(Icons.favorite, color: iconColor),
          ],
        ),
      ),
    );
  }
}

//================= Food data  =========================

class FoodData extends StatelessWidget {
  const FoodData(
      {Key? key,
      required this.title,
      required this.image,
      required this.onTap,
      this.iconColor = kLightGreyColor})
      : super(key: key);

  final String title, image;
  final Function() onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppDimensions.getHeight(8)),
        padding: EdgeInsets.only(left: AppDimensions.getWidth(8)),
        // width: AppDimensions.getWidth(280),
        // decoration: BoxDecoration(
        //     color: kWhiteColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            //image section
            Stack(
              children: [
                Container(
                  width: AppDimensions.getWidth(100),
                  height: AppDimensions.getHeight(100),
                  decoration: BoxDecoration(
                      // color: Colors.green,
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
                Positioned(
                  top: AppDimensions.getHeight(15),
                  child: Container(
                    height: AppDimensions.getHeight(20),
                    width: AppDimensions.getWidth(60),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppDimensions.getHeight(10)),
                        bottomRight:
                            Radius.circular(AppDimensions.getHeight(10)),
                      ),
                    ),
                    child: Center(
                        child: Text("15% Off",
                            style: AppStyles.subtitleText
                                .copyWith(color: kWhiteColor, fontSize: 13))),
                  ),
                ),
              ],
            ),
            //text Section
            Expanded(
              child: Container(
                height: AppDimensions.getHeight(100),
                padding: const EdgeInsets.all(3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableTextWidgetRes(
                        text: title, color: kBlackColor, fontSize: 15),
                    SizedBox(height: AppDimensions.getHeight(5)),
                    const ReusableTextWidgetRes(
                        text: "Hungry puppets",
                        color: kDarkGreyColor,
                        fontSize: 15),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimensions.getWidth(7)),
                      child: Row(
                        children: [
                          Row(
                            children: List.generate(
                                5,
                                (index) => const Icon(Icons.star,
                                    color: kPrimaryColor, size: 18)),
                          ),
                          SizedBox(width: AppDimensions.getWidth(3)),
                          Text("(12)"),
                        ],
                      ),
                    ),
                    SizedBox(height: AppDimensions.getHeight(5)),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimensions.getWidth(7)),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              FaIcon(FontAwesomeIcons.indianRupeeSign,
                                  size: 12),
                              Text("120"),
                            ],
                          ),
                          SizedBox(width: AppDimensions.getWidth(10)),
                          Row(
                            children: [
                              FaIcon(FontAwesomeIcons.indianRupeeSign,
                                  size: 12, color: kDarkGreyColor),
                              Text("190",
                                  style: AppStyles.subtitleText.copyWith(
                                      fontSize: 15,
                                      decoration: TextDecoration.lineThrough)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                InkWell(onTap: () {}, child: const Icon(Icons.add)),
                SizedBox(height: AppDimensions.getHeight(20)),
                InkWell(
                    onTap: () {},
                    child: Icon(Icons.favorite, color: iconColor)),
              ],
            ),
            SizedBox(width: AppDimensions.getWidth(15)),
          ],
        ),
      ),
    );
  }
}
