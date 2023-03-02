import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/styles.const.dart';

class RestaurantNotificationScreen extends StatelessWidget {
  const RestaurantNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Notifications",
          style:
              AppStyles.subtitleText.copyWith(color: kBlackColor, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new, color: kBlackColor),
        ),
      ),
      body: Center(
        child: Text("No notification found", style: AppStyles.subtitleText),
      ),
    );
  }
}
