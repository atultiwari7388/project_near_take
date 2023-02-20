import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/styles.const.dart';
import 'package:project_one/views/home/components/restaurant_detail_screen.views.dart';
import 'package:project_one/views/home/home_screen.views.dart';

class CuisinesFoodDetailsScreen extends StatelessWidget {
  const CuisinesFoodDetailsScreen(
      {super.key, required this.appBarTitle, required this.resImage});

  // ignore: prefer_typing_uninitialized_variables
  final appBarTitle;
  final resImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuisines $appBarTitle",
            style: AppStyles.subtitleText
                .copyWith(color: kBlackColor, fontSize: 18)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: kBlackColor),
        elevation: 1,
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () => Get.to(() => RestaurantDetailsScreen(
                resImage: resImage, title: appBarTitle)),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: AppDimensions.getHeight(8),
                      right: AppDimensions.getWidth(12)),
                  decoration: BoxDecoration(
                      // color: kGreyColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(3)),
                  child: Row(
                    children: [
                      //image section
                      Container(
                        width: AppDimensions.getWidth(90),
                        height: AppDimensions.getHeight(80),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(resImage), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      //text Section
                      Expanded(
                        child: Container(
                          height: AppDimensions.getHeight(110),
                          // width: AppDimensions.getWidth(230),
                          padding: const EdgeInsets.all(3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: AppDimensions.getHeight(20)),
                              ReusableTextWidgetRes(
                                  text: appBarTitle,
                                  color: kBlackColor,
                                  fontSize: 15),
                              SizedBox(height: AppDimensions.getHeight(5)),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: AppDimensions.getWidth(8)),
                                child: Text(
                                  "House:00, Road:00, Street:00,City",
                                  style: AppStyles.subtitleText
                                      .copyWith(fontSize: 14),
                                ),
                              ),

                              // SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: AppDimensions.getWidth(10)),
                      //favorite section
                      InkWell(
                          onTap: () {},
                          child: const FaIcon(FontAwesomeIcons.heart,
                              color: kLightGreyColor)),
                      SizedBox(width: AppDimensions.getWidth(10)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
