import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/styles.const.dart';
import 'package:project_one/widgets/text_form_field.widgets.dart';

class RestaurantBankInfoDetailScreen extends StatefulWidget {
  const RestaurantBankInfoDetailScreen({super.key});

  @override
  State<RestaurantBankInfoDetailScreen> createState() =>
      _RestaurantBankInfoDetailScreenState();
}

class _RestaurantBankInfoDetailScreenState
    extends State<RestaurantBankInfoDetailScreen> {
  TextEditingController bankNameController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  TextEditingController accountHoldController = TextEditingController();
  TextEditingController accountNumController = TextEditingController();

  final bankNameFocus = FocusNode();
  final branchNameFocus = FocusNode();
  final accountHoldFocus = FocusNode();
  final accountNumFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bank Info",
          style: AppStyles.subtitleText.copyWith(
            color: kBlackColor,
            fontSize: AppDimensions.getHeight(18),
          ),
        ),
        centerTitle: true,
        backgroundColor: kWhiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: kBlackColor),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.getHeight(12.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomReusableRowWidgetRes(
              icon: FontAwesomeIcons.buildingColumns,
              firstText: "Bank Name : ",
              secondText: "Bank",
            ),
            SizedBox(height: AppDimensions.getHeight(10)),
            const CustomReusableRowWidgetRes(
              icon: FontAwesomeIcons.buildingColumns,
              firstText: "Branch Name : ",
              secondText: "Punjab",
            ),
            SizedBox(height: AppDimensions.getHeight(10)),
            const CustomReusableRowWidgetRes(
              icon: FontAwesomeIcons.buildingColumns,
              firstText: "Holder Name : ",
              secondText: "ABCDE",
            ),
            SizedBox(height: AppDimensions.getHeight(10)),
            const CustomReusableRowWidgetRes(
              icon: FontAwesomeIcons.buildingColumns,
              firstText: "Account No :",
              secondText: "123456789",
            ),
            SizedBox(height: AppDimensions.getHeight(20)),
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
              onPressed: () {
                buildBottomSheetSection(context);
              },
              child: Text(
                "Edit",
                style: AppStyles.subtitleText.copyWith(
                    color: kWhiteColor, fontSize: AppDimensions.getHeight(17)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildBottomSheetSection(BuildContext context) {
    return Get.bottomSheet(
      Container(
        padding: EdgeInsets.only(
          left: AppDimensions.getHeight(12),
          right: AppDimensions.getHeight(12),
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.getHeight(20)),
            topRight: Radius.circular(AppDimensions.getHeight(20)),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
            ),
            SizedBox(height: AppDimensions.getHeight(5)),
            TextFormFieldWidget(
              controller: bankNameController,
              focusNode: bankNameFocus,
              onFieldSubmitValue: (value) {},
              keyboardType: TextInputType.name,
              obscureText: false,
              hintText: "Bank Name",
              formFieldValidator: (value) {},
            ),
            SizedBox(height: AppDimensions.getHeight(5)),
            TextFormFieldWidget(
              controller: branchNameController,
              focusNode: branchNameFocus,
              onFieldSubmitValue: (value) {},
              keyboardType: TextInputType.name,
              obscureText: false,
              hintText: "Branch Name",
              formFieldValidator: (value) {},
            ),
            SizedBox(height: AppDimensions.getHeight(5)),
            TextFormFieldWidget(
              controller: accountHoldController,
              focusNode: accountHoldFocus,
              onFieldSubmitValue: (value) {},
              keyboardType: TextInputType.name,
              obscureText: false,
              hintText: "Account Holder Name",
              formFieldValidator: (value) {},
            ),
            SizedBox(height: AppDimensions.getHeight(5)),
            TextFormFieldWidget(
              controller: accountNumController,
              focusNode: accountNumFocus,
              onFieldSubmitValue: (value) {},
              keyboardType: TextInputType.name,
              obscureText: false,
              hintText: "Account no.",
              formFieldValidator: (value) {},
            ),
            SizedBox(height: AppDimensions.getHeight(5)),
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
                "Update",
                style: AppStyles.subtitleText.copyWith(color: kWhiteColor),
              ),
            ),
            SizedBox(height: AppDimensions.getHeight(5)),
          ],
        ),
      ),
    );
  }
}

class CustomReusableRowWidgetRes extends StatelessWidget {
  const CustomReusableRowWidgetRes({
    super.key,
    required this.icon,
    required this.firstText,
    required this.secondText,
  });

  final IconData icon;
  final String firstText, secondText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(icon, color: kLightGreyColor),
        SizedBox(width: AppDimensions.getWidth(15)),
        Text(firstText,
            style: AppStyles.subtitleText.copyWith(color: kLightGreyColor)),
        const Spacer(),
        Text(secondText,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.subtitleText.copyWith(color: kBlackColor)),
      ],
    );
  }
}
