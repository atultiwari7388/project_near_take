import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/images.const.dart';
import 'package:project_one/constants/styles.const.dart';
import '../../constants/strings.const.dart';
import '../../routing/routes.dart';
import '../../widgets/text_form_field.widgets.dart';

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController numberController = TextEditingController();
    final numberFocusNode = FocusNode();
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            //for image
            Expanded(
                child: Lottie.asset(phoneVerificationScreen,
                    repeat: true, reverse: true)),
            //for text
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: AppDimensions.getWidth(12),
                    right: AppDimensions.getWidth(12)),
                child: Column(
                  children: [
                    Text(login, style: AppStyles.headlineText),
                    SizedBox(height: AppDimensions.getHeight(10)),
                    Text(enterYour10DigitMobileNumber,
                        style: AppStyles.subtitleText
                            .copyWith(color: Colors.black)),
                    SizedBox(height: AppDimensions.getHeight(10)),
                    TextFormFieldWidget(
                      controller: numberController,
                      focusNode: numberFocusNode,
                      onFieldSubmitValue: (value) {},
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      hintText: enterYourMobileHint,
                      formFieldValidator: (value) {},
                    ),
                    SizedBox(height: AppDimensions.getHeight(10)),
                    ElevatedButton(
                      onPressed: () =>
                          Get.offNamed(RouteHelper.getLocationScreen()),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(AppDimensions.getWidth(120),
                            AppDimensions.getHeight(43)),
                        backgroundColor: kPrimaryColor,
                        elevation: 1,
                      ),
                      child: Text(next,
                          style: AppStyles.subtitleText
                              .copyWith(color: kWhiteColor)),
                    ),
                    Flexible(child: Container()),
                    Text(appVersion,
                        style: AppStyles.subtitleText
                            .copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: AppDimensions.getHeight(20)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
