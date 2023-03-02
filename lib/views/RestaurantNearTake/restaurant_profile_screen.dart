import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/images.const.dart';
import 'package:project_one/constants/styles.const.dart';

class RestaurantProfileScreen extends StatelessWidget {
  const RestaurantProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            buildTopSection(),
            SizedBox(height: AppDimensions.getHeight(3)),
            buildContentSection(context),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: AppDimensions.getHeight(35),
          child: Center(
            child: Text("Version 1.0", style: AppStyles.subtitleText),
          ),
        ),
      ),
    );
  }

  Widget buildContentSection(context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimensions.getWidth(12.0),
        right: AppDimensions.getWidth(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCardSection(),
          SizedBox(height: AppDimensions.getHeight(20)),
          Container(
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.lock, color: kLightGreyColor),
              title: Text("Change Password",
                  style: AppStyles.subtitleText.copyWith()),
              onTap: () => Get.snackbar(
                "Message",
                "Something went wrong",
                backgroundColor: kRedColor,
                colorText: kWhiteColor,
              ),
            ),
          ),
          SizedBox(height: AppDimensions.getHeight(20)),
          Container(
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.edit, color: kLightGreyColor),
              title: Text("Edit Profile",
                  style: AppStyles.subtitleText.copyWith()),
              onTap: () => Get.snackbar(
                "Message",
                "Something went wrong",
                backgroundColor: kRedColor,
                colorText: kWhiteColor,
              ),
            ),
          ),
          SizedBox(height: AppDimensions.getHeight(20)),
          Container(
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.delete, color: kLightGreyColor),
              title: Text("Delete Account",
                  style: AppStyles.subtitleText.copyWith()),
              onTap: () => Get.snackbar(
                "Message",
                "Something went wrong",
                backgroundColor: kRedColor,
                colorText: kWhiteColor,
              ),
            ),
          ),
          SizedBox(height: AppDimensions.getHeight(20)),
        ],
      ),
    );
  }

//================  Card Section  ===========================
  Row buildCardSection() {
    return Row(
      children: [
        const Expanded(
          child: StatsCard(
            firstText: "556 days",
            secondText: "Since Joining",
          ),
        ),
        SizedBox(width: AppDimensions.getWidth(20)),
        const Expanded(
          child: StatsCard(
            firstText: "39",
            secondText: "Total Orders",
          ),
        ),
      ],
    );
  }

//================ Top Section  ==============================
  Widget buildTopSection() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: AppDimensions.getWidth(80)),
            child: buildCoverImage()),
        Positioned(
            top: AppDimensions.getHeight(145), child: buildProfileImage()),
        Positioned(
          top: AppDimensions.getHeight(12),
          left: AppDimensions.getWidth(10),
          child: InkWell(
            onTap: () => Get.back(),
            child: const CircleAvatar(
              backgroundColor: kWhiteColor,
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
        )
      ],
    );
  }

//==================== Image section ===================================
  Widget buildCoverImage() {
    return Container(
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        image: DecorationImage(image: AssetImage(pizzaImg), fit: BoxFit.cover),
      ),
      //add network image or asset image
      height: AppDimensions.getHeight(220),
      width: double.infinity,
    );
  }

  Widget buildProfileImage() {
    return CircleAvatar(
      radius: AppDimensions.getWidth(144) / 2,
      backgroundColor: kLightGreyColor,
      backgroundImage: const AssetImage("assets/logo.png"),
    );
  }
}

//=========================== Stats Section ==========================
class StatsCard extends StatelessWidget {
  const StatsCard({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  final String firstText, secondText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.getHeight(120),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(
          AppDimensions.getHeight(10),
        ),
        boxShadow: const [
          BoxShadow(
            color: kLightGreyColor,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            firstText,
            style: AppStyles.subtitleText.copyWith(color: kPrimaryColor),
          ),
          SizedBox(height: AppDimensions.getHeight(5)),
          Text(
            secondText,
            style: AppStyles.subtitleText.copyWith(
              color: kLightGreyColor,
              fontSize: AppDimensions.getHeight(12),
            ),
          ),
        ],
      ),
    );
  }
}
