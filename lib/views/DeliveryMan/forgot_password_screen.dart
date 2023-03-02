import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/widgets/text_form_field.widgets.dart';

import '../../constants/app_colors.constants.dart';
import '../../constants/styles.const.dart';

class DeliveryManForgotPassScreen extends StatefulWidget {
  const DeliveryManForgotPassScreen({super.key});

  @override
  State<DeliveryManForgotPassScreen> createState() =>
      _DeliveryManForgotPassScreenState();
}

class _DeliveryManForgotPassScreenState
    extends State<DeliveryManForgotPassScreen> {
  final TextEditingController phoneController = TextEditingController();
  final phoneFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Forgot Password",
          style: AppStyles.subtitleText.copyWith(
            color: kBlackColor,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new, color: kBlackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.getHeight(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/forgotPass.json",
                // height: 100,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              SizedBox(height: AppDimensions.getHeight(20)),
              Text(
                "Please enter your registered Mobile Number so that we can help you to recover your password",
                textAlign: TextAlign.center,
                style: AppStyles.subtitleText
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: AppDimensions.getHeight(20)),
              TextFormFieldWidget(
                controller: phoneController,
                focusNode: phoneFocusNode,
                onFieldSubmitValue: (value) {},
                keyboardType: TextInputType.phone,
                obscureText: false,
                hintText: "Phone Number",
                formFieldValidator: (value) {},
              ),
              SizedBox(height: AppDimensions.getHeight(20)),
              Padding(
                padding: EdgeInsets.all(AppDimensions.getHeight(8)),
                child: InkWell(
                  onTap: () {
                    Get.snackbar(
                      "Success",
                      "Thank you for registration , we will notify as soon as possible ",
                      backgroundColor: Colors.green,
                      colorText: kWhiteColor,
                    );
                  },
                  child: Container(
                    height: AppDimensions.getHeight(47),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius:
                          BorderRadius.circular(AppDimensions.getHeight(10)),
                    ),
                    child: Center(
                      child: Text(
                        "Next",
                        style: AppStyles.subtitleText.copyWith(
                            color: kWhiteColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
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
