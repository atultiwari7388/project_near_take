import 'package:flutter/material.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/styles.const.dart';
import 'package:project_one/widgets/text_form_field.widgets.dart';

class RestaurantRegistrationScreen extends StatefulWidget {
  const RestaurantRegistrationScreen({super.key});

  @override
  State<RestaurantRegistrationScreen> createState() =>
      _RestaurantRegistrationScreenState();
}

class _RestaurantRegistrationScreenState
    extends State<RestaurantRegistrationScreen> {
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
            ],
          ),
        ),
      ),
    );
  }
}
