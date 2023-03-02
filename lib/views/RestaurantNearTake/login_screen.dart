import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/styles.const.dart';
import 'package:project_one/views/RestaurantNearTake/restaurant_bottom_screen.dart';
import 'package:project_one/widgets/text_form_field.widgets.dart';

class RestaurantLoginScreen extends StatefulWidget {
  const RestaurantLoginScreen({super.key});

  @override
  State<RestaurantLoginScreen> createState() => _RestaurantLoginScreenState();
}

class _RestaurantLoginScreenState extends State<RestaurantLoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final FocusNode phoneFocus = FocusNode();
  final FocusNode passFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.getHeight(14)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo section
              SizedBox(height: AppDimensions.getHeight(100)),
              Container(
                height: AppDimensions.getHeight(190),
                width: AppDimensions.getWidth(200),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/logo.png"),
                        fit: BoxFit.cover)),
              ),
              //heading section
              SizedBox(height: AppDimensions.getHeight(10)),
              Text("SIGN IN", style: AppStyles.headlineText),
              SizedBox(height: AppDimensions.getHeight(20)),
              //textfield section with phone number
              TextFormFieldWidget(
                controller: emailController,
                focusNode: phoneFocus,
                onFieldSubmitValue: (value) {},
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                hintText: "Email",
                formFieldValidator: (value) {},
              ),
              SizedBox(height: AppDimensions.getHeight(10)),
              TextFormFieldWidget(
                controller: passController,
                focusNode: passFocus,
                onFieldSubmitValue: (value) {},
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                hintText: "Password",
                formFieldValidator: (value) {},
              ),
              SizedBox(height: AppDimensions.getHeight(10)),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Forgot Password ?",
                    style: AppStyles.subtitleText.copyWith(
                      color: kPrimaryColor,
                      fontSize: AppDimensions.getHeight(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.getHeight(20)),
              //button section
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(
                    MediaQuery.of(context).size.width,
                    AppDimensions.getHeight(48),
                  ),
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () =>
                    Get.offAll(() => const RestaurantBottomScreen()),
                child: Text(
                  "Sign In",
                  style: AppStyles.subtitleText.copyWith(
                      color: kWhiteColor,
                      fontSize: AppDimensions.getHeight(17)),
                ),
              ),

              SizedBox(height: AppDimensions.getHeight(50)),

              RichText(
                text: TextSpan(
                  text: "Join as a ",
                  style: AppStyles.subtitleText,
                  children: [
                    TextSpan(
                      text: "Restaurant",
                      style: AppStyles.subtitleText.copyWith(
                          color: kBlackColor, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.offAll(() => const RestaurantBottomScreen());
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
