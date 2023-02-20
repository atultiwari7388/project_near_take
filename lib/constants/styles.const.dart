import 'package:flutter/material.dart';
import 'package:project_one/constants/app_colors.constants.dart';

import 'dimensions.const.dart';

class AppStyles {
  static TextStyle headlineText =  TextStyle(
      color: kBlackColor, fontSize: AppDimensions.getHeight(30), fontWeight: FontWeight.bold);

  static TextStyle subtitleText =  TextStyle(
    color: kDarkGreyColor,
    fontSize: AppDimensions.getHeight(16),
    fontWeight: FontWeight.w400,
  );

  static ButtonStyle borderedButtonStyle = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    backgroundColor: MaterialStateProperty.all(Colors.white),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        side: const BorderSide(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(AppDimensions.getHeight(10)),
      ),
    ),
  );
}
