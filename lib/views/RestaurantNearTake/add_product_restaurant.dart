import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.constants.dart';
import '../../constants/dimensions.const.dart';
import '../../constants/styles.const.dart';
import '../../widgets/text_form_field.widgets.dart';

class AddProductRestaurantScreen extends StatefulWidget {
  const AddProductRestaurantScreen({super.key});

  @override
  State<AddProductRestaurantScreen> createState() =>
      _AddProductRestaurantScreenState();
}

class _AddProductRestaurantScreenState
    extends State<AddProductRestaurantScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController foodDescriptionController =
      TextEditingController();
  final TextEditingController foodPriceController = TextEditingController();
  final TextEditingController foodDiscountController = TextEditingController();
  final TextEditingController foodTagController = TextEditingController();
  final TextEditingController foodAddOnsController = TextEditingController();

  final foodNameFocus = FocusNode();
  final foodDescFocus = FocusNode();
  final foodPrice = FocusNode();
  final foodDiscountFocus = FocusNode();
  final foodTagFocus = FocusNode();
  final foodAddOnsFocus = FocusNode();

  final categoryListData = [
    "Burger",
    "Biryani",
    "Asian",
    "Cake",
    "Coffee & Drinks",
    "Chinese",
    "Fast Food",
    "Kabab & More",
    "Indian",
    "Noodles",
    "Mexican Food",
    "Pasta",
    "Pizza",
    "Snacks",
    "Thai",
    "Varients",
  ];

  final discountListData = [
    "Percent",
    "Amount",
  ];

  String? categorySelectedValue = "Burger";
  String? discountSelectedValue = "Percent";

  String? foodType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        iconTheme: const IconThemeData(color: kBlackColor),
        elevation: 0,
        title: Text(
          "Add Food",
          style: AppStyles.subtitleText.copyWith(
            color: kBlackColor,
            fontSize: AppDimensions.getHeight(18),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.getHeight(14)),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //food name
                const CustomTextWidget(text: "Food Name"),
                SizedBox(height: AppDimensions.getHeight(5)),
                buildFoodNameTextField(),
                SizedBox(height: AppDimensions.getHeight(10)),
                const CustomTextWidget(text: "Food Description"),
                SizedBox(height: AppDimensions.getHeight(5)),
                buildFoodDescTextField(),
                SizedBox(height: AppDimensions.getHeight(10)),
                const CustomTextWidget(text: "Price"),
                SizedBox(height: AppDimensions.getHeight(5)),
                buildFoodPriceTextField(),
                SizedBox(height: AppDimensions.getHeight(10)),
                const CustomTextWidget(text: "Discount"),
                SizedBox(height: AppDimensions.getHeight(5)),
                buildDiscountSection(),
                SizedBox(height: AppDimensions.getHeight(10)),
                const CustomTextWidget(text: "Food Type"),
                SizedBox(height: AppDimensions.getHeight(10)),
                buildRadioButtonSection(),
                SizedBox(height: AppDimensions.getHeight(10)),
                // food type section => veg -non veg
                const CustomTextWidget(text: "Category"),
                SizedBox(height: AppDimensions.getHeight(5)),
                buildCategoryDropDownSection(),
                SizedBox(height: AppDimensions.getHeight(10)),
                const CustomTextWidget(text: "Tag"),
                SizedBox(height: AppDimensions.getHeight(5)),
                //Tag section
                buildTagSection(),
                SizedBox(height: AppDimensions.getHeight(10)),
                const CustomTextWidget(text: "Addons"),
                SizedBox(height: AppDimensions.getHeight(5)),
                buildAddonsSection(),
                SizedBox(height: AppDimensions.getHeight(10)),
                const CustomTextWidget(text: "Food Image"),
                SizedBox(height: AppDimensions.getHeight(15)),
                buildImageSection(),
                SizedBox(height: AppDimensions.getHeight(30)),

                //time range
                // Food Image
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: buildBottomButton(context),
    );
  }

//================ Radio Button Section ==================
  Widget buildRadioButtonSection() {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            activeColor: kPrimaryColor,
            title: Text(
              "non-veg",
              style: AppStyles.subtitleText.copyWith(
                fontSize: AppDimensions.getHeight(15),
              ),
            ),
            value: "non-veg",
            groupValue: foodType,
            onChanged: (value) {
              setState(() {
                foodType = value;
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            activeColor: kPrimaryColor,
            title: Text(
              "veg",
              style: AppStyles.subtitleText.copyWith(
                fontSize: AppDimensions.getHeight(15),
              ),
            ),
            value: "veg",
            groupValue: foodType,
            onChanged: (value) {
              setState(() {
                foodType = value;
              });
            },
          ),
        )
      ],
    );
  }

//================= Bottom Button Section  =======================
  Widget buildBottomButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.getHeight(8)),
      child: InkWell(
        onTap: () {
          if (formKey.currentState!.validate()) {
            Get.snackbar(
              "Success",
              "Thank you , we will notify as soon as possible ",
              backgroundColor: Colors.green,
              colorText: kWhiteColor,
            );
          }
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
    );
  }

//================= Image Section  ===============================
  Widget buildImageSection() {
    return Center(
      child: Stack(
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
    );
  }

//================= Add-ons Section  =============================
  Widget buildAddonsSection() {
    return TextFormFieldWidget(
      controller: foodAddOnsController,
      focusNode: foodAddOnsFocus,
      onFieldSubmitValue: (value) {},
      keyboardType: TextInputType.number,
      obscureText: false,
      hintText: "Addons",
      formFieldValidator: (value) {},
    );
  }

//=================== Tag Section  ==========================
  Widget buildTagSection() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextFormFieldWidget(
            controller: foodTagController,
            focusNode: foodTagFocus,
            onFieldSubmitValue: (value) {},
            keyboardType: TextInputType.number,
            obscureText: false,
            hintText: "Discount",
            formFieldValidator: (value) {},
          ),
        ),
        SizedBox(width: AppDimensions.getWidth(15)),
        Expanded(
          child: Container(
            height: AppDimensions.getHeight(46),
            padding: EdgeInsets.all(AppDimensions.getHeight(7)),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(AppDimensions.getHeight(5)),
            ),
            child: Center(
              child: Text(
                "Add",
                style: AppStyles.subtitleText.copyWith(color: kWhiteColor),
              ),
            ),
          ),
        ),
      ],
    );
  }

//=================== Category Drop down section ==================
  DropdownButtonFormField<String> buildCategoryDropDownSection() {
    return DropdownButtonFormField(
      value: categorySelectedValue,
      items: categoryListData
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          categorySelectedValue = value;
        });
      },
      icon: const Icon(
        Icons.arrow_drop_down_circle,
        color: kPrimaryColor,
      ),
      dropdownColor: kWhiteColor,
    );
  }

//=================== Discount Section  ===========================
  Widget buildDiscountSection() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextFormFieldWidget(
            controller: foodDiscountController,
            focusNode: foodDiscountFocus,
            onFieldSubmitValue: (value) {},
            keyboardType: TextInputType.number,
            obscureText: false,
            hintText: "Discount",
            formFieldValidator: (value) {},
          ),
        ),
        SizedBox(width: AppDimensions.getWidth(12)),
        //drop down section
        Expanded(
          child: DropdownButtonFormField(
            value: discountSelectedValue,
            items: discountListData
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                discountSelectedValue = value;
              });
            },
            icon: const Icon(
              Icons.arrow_drop_down_circle,
              color: kPrimaryColor,
            ),
            dropdownColor: kWhiteColor,
          ),
        ),
      ],
    );
  }

//==================  Food Price Section  =========================
  TextFormFieldWidget buildFoodPriceTextField() {
    return TextFormFieldWidget(
      controller: foodPriceController,
      focusNode: foodPrice,
      onFieldSubmitValue: (value) {},
      keyboardType: TextInputType.number,
      obscureText: false,
      hintText: "Price",
      formFieldValidator: (value) {},
    );
  }

//================== Food Description Section  ======================
  TextFormFieldWidget buildFoodDescTextField() {
    return TextFormFieldWidget(
      controller: foodDescriptionController,
      focusNode: foodDescFocus,
      onFieldSubmitValue: (value) {},
      keyboardType: TextInputType.name,
      obscureText: false,
      hintText: "Food Description",
      formFieldValidator: (value) {},
    );
  }

//=================== Food Name =======================
  TextFormFieldWidget buildFoodNameTextField() {
    return TextFormFieldWidget(
      controller: foodNameController,
      focusNode: foodNameFocus,
      onFieldSubmitValue: (value) {},
      keyboardType: TextInputType.name,
      obscureText: false,
      hintText: "Food Name",
      formFieldValidator: (value) {
        if (value == null) {
          return "Please Enter name";
        }
      },
    );
  }
}

//================== Custom Text Widget ==================
class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: AppStyles.subtitleText.copyWith(color: kLightGreyColor));
  }
}
