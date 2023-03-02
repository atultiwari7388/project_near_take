import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/styles.const.dart';
import 'package:project_one/widgets/text_form_field.widgets.dart';

class DeliveryManRegistrationScreen extends StatefulWidget {
  const DeliveryManRegistrationScreen({super.key});

  @override
  State<DeliveryManRegistrationScreen> createState() =>
      _DeliveryManRegistrationScreenState();
}

class _DeliveryManRegistrationScreenState
    extends State<DeliveryManRegistrationScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController identityNumberController =
      TextEditingController();

  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final passFocusNode = FocusNode();
  final identityFocusNode = FocusNode();

  final deliveryManType = [
    "Freelance",
    "Full Time",
    "Internship",
    "Part Time",
  ];

  final zoneLevel = [
    "Mohali",
    "Chandigarh",
    "Punjab",
    "Zirakpur",
  ];

  final identityLevel = [
    "Adhaar",
    "Driving License",
    "Passport",
  ];

  final vehicleLevel = [
    "Car",
    "Bike",
    "Cycle",
  ];

  String? deliverySelectedValue = "Freelance";
  String? zoneSelectedValue = "Mohali";
  String? identitySelValue = "Adhaar";
  String? vehicleSelectedValue = "Car";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Delivery Man Registration",
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
          padding: EdgeInsets.all(AppDimensions.getHeight(14)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("Delivery Man Image",
                    style: AppStyles.subtitleText.copyWith(color: kBlackColor)),
              ),
              SizedBox(height: AppDimensions.getHeight(10)),
              //image section
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: AppDimensions.getHeight(140),
                      width: AppDimensions.getWidth(180),
                      decoration: BoxDecoration(
                        color: kLightGreyColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Positioned(
                      left: AppDimensions.getWidth(0),
                      right: AppDimensions.getWidth(0),
                      bottom: AppDimensions.getHeight(18),
                      top: AppDimensions.getHeight(18),
                      child: CircleAvatar(
                        backgroundColor: kWhiteColor,
                        radius: 20,
                        child: Icon(
                          Icons.camera_alt,
                          size: AppDimensions.getHeight(30),
                          color: kBlackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimensions.getHeight(30)),

              Padding(
                padding: EdgeInsets.only(left: AppDimensions.getWidth(5.0)),
                child: Row(
                  children: [
                    Expanded(
                      child: Text("First Name",
                          style: AppStyles.subtitleText
                              .copyWith(color: kBlackColor)),
                    ),
                    Expanded(
                      child: Text("Last Name",
                          style: AppStyles.subtitleText
                              .copyWith(color: kBlackColor)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimensions.getHeight(5)),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormFieldWidget(
                      controller: firstNameController,
                      focusNode: firstNameFocusNode,
                      onFieldSubmitValue: (value) {},
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      hintText: "First name",
                      formFieldValidator: (value) {},
                    ),
                  ),
                  SizedBox(width: AppDimensions.getWidth(10)),
                  Expanded(
                    flex: 1,
                    child: TextFormFieldWidget(
                      controller: lastNameController,
                      focusNode: lastNameFocusNode,
                      onFieldSubmitValue: (value) {},
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      hintText: "Last name",
                      formFieldValidator: (value) {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppDimensions.getHeight(20)),
              Text("Email",
                  style: AppStyles.subtitleText.copyWith(color: kBlackColor)),
              SizedBox(height: AppDimensions.getHeight(5)),
              TextFormFieldWidget(
                controller: emailController,
                focusNode: emailFocusNode,
                onFieldSubmitValue: (value) {},
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                hintText: "Email Address",
                formFieldValidator: (value) {},
              ),

              SizedBox(height: AppDimensions.getHeight(10)),
              Text("Phone Number",
                  style: AppStyles.subtitleText.copyWith(color: kBlackColor)),
              SizedBox(height: AppDimensions.getHeight(5)),
              TextFormFieldWidget(
                controller: phoneController,
                focusNode: phoneFocusNode,
                onFieldSubmitValue: (value) {},
                keyboardType: TextInputType.phone,
                obscureText: false,
                hintText: "Phone",
                formFieldValidator: (value) {},
              ),
              SizedBox(height: AppDimensions.getHeight(10)),
              Text("Password",
                  style: AppStyles.subtitleText.copyWith(color: kBlackColor)),
              SizedBox(height: AppDimensions.getHeight(5)),
              TextFormFieldWidget(
                controller: passController,
                focusNode: passFocusNode,
                onFieldSubmitValue: (value) {},
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                hintText: "Password",
                formFieldValidator: (value) {},
              ),
              SizedBox(height: AppDimensions.getHeight(10)),
              //drop down section
              Text("Delivery Man type",
                  style: AppStyles.subtitleText.copyWith(color: kBlackColor)),
              SizedBox(height: AppDimensions.getHeight(10)),
              DropdownButtonFormField(
                value: deliverySelectedValue,
                items: deliveryManType
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    deliverySelectedValue = value;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down_circle,
                  color: kPrimaryColor,
                ),
                dropdownColor: kWhiteColor,
              ),

              SizedBox(height: AppDimensions.getHeight(10)),
              Text("Zone",
                  style: AppStyles.subtitleText.copyWith(color: kBlackColor)),
              SizedBox(height: AppDimensions.getHeight(10)),
              DropdownButtonFormField(
                value: zoneSelectedValue,
                items: zoneLevel
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    zoneSelectedValue = value;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down_circle,
                  color: kPrimaryColor,
                ),
                dropdownColor: kWhiteColor,
              ),
              SizedBox(height: AppDimensions.getHeight(10)),
              Text("Identity Type",
                  style: AppStyles.subtitleText.copyWith(color: kBlackColor)),
              SizedBox(height: AppDimensions.getHeight(10)),
              DropdownButtonFormField(
                value: identitySelValue,
                items: identityLevel
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    identitySelValue = value;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down_circle,
                  color: kPrimaryColor,
                ),
                dropdownColor: kWhiteColor,
              ),
              SizedBox(height: AppDimensions.getHeight(10)),
              TextFormFieldWidget(
                controller: identityNumberController,
                focusNode: identityFocusNode,
                onFieldSubmitValue: (value) {},
                keyboardType: TextInputType.streetAddress,
                obscureText: false,
                hintText: "Identity Number",
                formFieldValidator: (value) {},
              ),
              SizedBox(height: AppDimensions.getHeight(15)),
              Text("Vehicle Type",
                  style: AppStyles.subtitleText.copyWith(color: kBlackColor)),
              SizedBox(height: AppDimensions.getHeight(10)),
              DropdownButtonFormField(
                value: vehicleSelectedValue,
                items: vehicleLevel
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    vehicleSelectedValue = value;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down_circle,
                  color: kPrimaryColor,
                ),
                dropdownColor: kWhiteColor,
              ),
              SizedBox(height: AppDimensions.getHeight(20)),
              Text("Identity Images",
                  style: AppStyles.subtitleText.copyWith(color: kBlackColor)),
              SizedBox(height: AppDimensions.getHeight(10)),
              //image section
              Stack(
                children: [
                  Container(
                    height: AppDimensions.getHeight(140),
                    width: AppDimensions.getWidth(180),
                    decoration: BoxDecoration(
                      color: kLightGreyColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: kPrimaryColor),
                    ),
                  ),
                  Positioned(
                    left: AppDimensions.getWidth(0),
                    right: AppDimensions.getWidth(0),
                    bottom: AppDimensions.getHeight(18),
                    top: AppDimensions.getHeight(18),
                    child: CircleAvatar(
                      backgroundColor: kWhiteColor,
                      radius: 20,
                      child: Icon(
                        Icons.camera_alt,
                        size: AppDimensions.getHeight(30),
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppDimensions.getHeight(30)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
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
              borderRadius: BorderRadius.circular(AppDimensions.getHeight(10)),
            ),
            child: Center(
              child: Text(
                "Submit",
                style: AppStyles.subtitleText.copyWith(
                    color: kWhiteColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
