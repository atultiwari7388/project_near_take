import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.constants.dart';
import '../../constants/dimensions.const.dart';
import '../../constants/styles.const.dart';

class RestaurantCategoryScreen extends StatelessWidget {
  const RestaurantCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.all(AppDimensions.getHeight(10)),
            child: const CategoryCard(),
          );
        },
      ),
    );
  }

//==================== App Bar ==============================================
  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        "Categories",
        style: AppStyles.subtitleText.copyWith(
          color: kBlackColor,
          fontSize: AppDimensions.getHeight(18),
        ),
      ),
      centerTitle: true,
      backgroundColor: kWhiteColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: kBlackColor),
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}

//========================  Category Card ================================

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.getHeight(10)),
      // height: AppDimensions.getHeight(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(
          AppDimensions.getHeight(7),
        ),
      ),
      child: Row(
        children: [
          //image section
          Container(
            height: AppDimensions.getHeight(60),
            width: AppDimensions.getWidth(60),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(
                AppDimensions.getHeight(7),
              ),
            ),
          ),
          SizedBox(width: AppDimensions.getWidth(15)),
          //text section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Burger",
                style: AppStyles.subtitleText.copyWith(
                  color: kBlackColor,
                  fontSize: AppDimensions.getHeight(16),
                ),
              ),
              SizedBox(height: AppDimensions.getHeight(8)),
              Text(
                "Id: 1",
                style: AppStyles.subtitleText.copyWith(
                  color: kLightGreyColor,
                  fontSize: AppDimensions.getHeight(13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
