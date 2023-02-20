import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/images.const.dart';
import 'package:project_one/constants/strings.const.dart';
import 'package:project_one/constants/styles.const.dart';
import 'package:project_one/routing/routes.dart';
import 'package:project_one/widgets/custom_button_widget.widgets.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Location",
            style: AppStyles.subtitleText.copyWith(color: kBlackColor)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: Lottie.asset(jumpLocation, repeat: true,fit: BoxFit.cover)),
          Expanded(
            flex: 2,
            child: Padding(
              padding:  EdgeInsets.all(AppDimensions.getWidth(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   SizedBox(height: AppDimensions.getHeight(20)),
                  Text(findRestaurantNear,
                      textAlign: TextAlign.center,
                      style: AppStyles.headlineText.copyWith(fontSize: AppDimensions.getHeight(18))),
                   SizedBox(height: AppDimensions.getHeight(20)),
                  Text(
                      "By allowing location access, you can search for restaurants and food near you and receive more accurate delivery",
                      textAlign: TextAlign.center,
                      style: AppStyles.subtitleText.copyWith(fontSize: AppDimensions.getHeight(15))),
                  //button one
                   SizedBox(height: AppDimensions.getHeight(30)),

                  CustomButtonWidget(
                    onTap: () => Get.offNamed(RouteHelper.getInitialScreen()),
                    icon: FontAwesomeIcons.locationArrow,
                    text: "Use Current Location",
                    backgroundColor: kPrimaryColor,
                    textColor: kWhiteColor,
                    iconColor: kWhiteColor,
                  ),
                  const SizedBox(height: 15),
                  //button two
                  CustomButtonWidget(
                    onTap: () => Get.offNamed(RouteHelper.getInitialScreen()),
                    icon: FontAwesomeIcons.map,
                    text: "Set From Map",
                    borderColor: kPrimaryColor,
                    textColor: kPrimaryColor,
                    iconColor: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
