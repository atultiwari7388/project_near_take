import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/styles.const.dart';
import 'package:project_one/views/DeliveryMan/delivery_man_registration_screen.dart';
import 'package:project_one/views/DeliveryMan/forgot_password_screen.dart';
import 'package:project_one/widgets/text_form_field.widgets.dart';

class DeliveryManSignInScreen extends StatefulWidget {
  const DeliveryManSignInScreen({super.key});

  @override
  State<DeliveryManSignInScreen> createState() =>
      _DeliveryManSignInScreenState();
}

class _DeliveryManSignInScreenState extends State<DeliveryManSignInScreen> {
  final TextEditingController phoneController = TextEditingController();
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
                controller: phoneController,
                focusNode: phoneFocus,
                onFieldSubmitValue: (value) {},
                keyboardType: TextInputType.number,
                obscureText: false,
                hintText: "Phone",
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
                  onTap: () => Get.to(
                    () => const DeliveryManForgotPassScreen(),
                  ),
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
                onPressed: () {},
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
                      text: "Delivery man",
                      style: AppStyles.subtitleText.copyWith(
                          color: kBlackColor, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => const DeliveryManRegistrationScreen());
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
