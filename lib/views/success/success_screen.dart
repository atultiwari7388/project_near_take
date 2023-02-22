import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/styles.const.dart';

import '../../routing/routes.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //icons
              Text(
                "You Place The Order Successfully",
                textAlign: TextAlign.center,
                style: AppStyles.subtitleText.copyWith(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: AppDimensions.getHeight(20),
                ),
              ),
              SizedBox(height: AppDimensions.getHeight(20)),
              Text(
                "Your order is placed successfully. We start our delivery process and you will receive your food soon",
                textAlign: TextAlign.center,
                style: AppStyles.subtitleText
                    .copyWith(fontSize: AppDimensions.getHeight(14)),
              ),
              SizedBox(height: AppDimensions.getHeight(20)),
              Lottie.asset(
                "assets/success.json",
                height: AppDimensions.getHeight(200),
                width: double.infinity,
                // fit: BoxFit.cover,
              ),
              SizedBox(height: AppDimensions.getHeight(20)),
              Text(
                "You have earned 118 points. It will add to your balance when the order is delivered",
                textAlign: TextAlign.center,
                style: AppStyles.subtitleText.copyWith(
                  fontSize: AppDimensions.getHeight(13),
                ),
              ),
              SizedBox(height: AppDimensions.getHeight(20)),
              InkWell(
                onTap: () {
                  Get.back();
                  Get.back();
                  Get.offNamed(RouteHelper.getInitialScreen());
                },
                child: Container(
                  height: AppDimensions.getHeight(46),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.getHeight(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Back to Home",
                      style: AppStyles.subtitleText.copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
