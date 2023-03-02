import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.constants.dart';
import '../../constants/dimensions.const.dart';
import '../../constants/styles.const.dart';
import '../../widgets/text_form_field.widgets.dart';

class RestaurantAddOnsScreen extends StatefulWidget {
  const RestaurantAddOnsScreen({super.key});

  @override
  State<RestaurantAddOnsScreen> createState() => _RestaurantAddOnsScreenState();
}

class _RestaurantAddOnsScreenState extends State<RestaurantAddOnsScreen> {
  TextEditingController addonNameController = TextEditingController();
  TextEditingController addonPriceController = TextEditingController();

  final addonNameFocus = FocusNode();
  final addonPriceFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Addons",
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () => buildBottomSheetSection(context),
        child: const Icon(Icons.add_circle_outline, color: kWhiteColor),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AddonsCard(
              firstText: "Extra Chicken",
              secondText: "₹ 25.00",
              backgroundColor: index.isEven ? kLightGreyColor : kWhiteColor,
              onTap: () => buildDialogBox(context),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> buildBottomSheetSection(BuildContext context) {
    return Get.bottomSheet(
      Container(
        height: AppDimensions.getHeight(300),
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
              controller: addonNameController,
              focusNode: addonNameFocus,
              onFieldSubmitValue: (value) {},
              keyboardType: TextInputType.name,
              obscureText: false,
              hintText: "Name",
              formFieldValidator: (value) {},
            ),
            SizedBox(height: AppDimensions.getHeight(5)),
            TextFormFieldWidget(
              controller: addonPriceController,
              focusNode: addonPriceFocus,
              onFieldSubmitValue: (value) {},
              keyboardType: TextInputType.number,
              obscureText: false,
              hintText: "Price",
              formFieldValidator: (value) {},
            ),
            SizedBox(height: AppDimensions.getHeight(5)),
            const Spacer(),
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
                "Submit",
                style: AppStyles.subtitleText.copyWith(color: kWhiteColor),
              ),
            ),
            SizedBox(height: AppDimensions.getHeight(5)),
          ],
        ),
      ),
    );
  }

//===================  Dialog Box =============================
  Future<dynamic> buildDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit / Delete',
              style: AppStyles.subtitleText.copyWith(color: kBlackColor)),
          content: Text(
            'Are You sure you want to delete or edit.',
            style: AppStyles.subtitleText.copyWith(
              fontSize: AppDimensions.getHeight(15),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Edit",
                style: AppStyles.subtitleText.copyWith(color: Colors.green),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Delete",
                style: AppStyles.subtitleText.copyWith(color: kRedColor),
              ),
            ),
          ],
        );
      },
    );
  }
}

//==================  Addons Card  ============================

class AddonsCard extends StatelessWidget {
  const AddonsCard({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.backgroundColor,
    required this.onTap,
  });

  final String firstText, secondText;
  final Color backgroundColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Row(
        children: [
          Text(
            firstText,
            style: AppStyles.subtitleText.copyWith(
              color: kBlackColor,
              fontSize: AppDimensions.getHeight(16),
            ),
          ),
          const Spacer(),
          Text(
            secondText,
            style: AppStyles.subtitleText.copyWith(
              color: kBlackColor,
              fontSize: AppDimensions.getHeight(16),
            ),
          ),
          InkWell(
            onTap: onTap,
            child: const Icon(Icons.more_vert, color: kBlackColor),
          )
        ],
      ),
    );
  }
}
