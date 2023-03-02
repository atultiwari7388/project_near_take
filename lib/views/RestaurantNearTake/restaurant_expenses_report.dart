import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import '../../constants/dimensions.const.dart';
import '../../constants/styles.const.dart';

class RestaurantExpensesReport extends StatelessWidget {
  const RestaurantExpensesReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expenses Report",
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
        padding: EdgeInsets.all(AppDimensions.getHeight(12)),
        child: Column(
          children: [
            //search Bar
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimensions.getWidth(8),
                  right: AppDimensions.getWidth(8),
                  bottom: AppDimensions.getHeight(9)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: TextFormField(
                        onChanged: (newValue) {},
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                          hintText: "Search with order id",
                          filled: true,
                          fillColor: kPrimaryColor.withOpacity(0.24),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: AppDimensions.getWidth(12)),
                          suffixIcon:
                              const Icon(Icons.search, color: kPrimaryColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kWhiteColor),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kShadowColor),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //date section
            //list view section
            const ReportCard(),
            const ReportCard(),
            const ReportCard(),
            const ReportCard(),
          ],
        ),
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.getHeight(12)),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order ID: #100035",
            style: AppStyles.subtitleText.copyWith(
              color: kBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "07 Feb 2023  11:08",
                style: AppStyles.subtitleText.copyWith(
                  fontSize: AppDimensions.getHeight(12),
                ),
              ),
              Text(
                "Amount",
                style: AppStyles.subtitleText.copyWith(
                  fontSize: AppDimensions.getHeight(12),
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimensions.getHeight(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(
                text: "Expense Type -",
                style: AppStyles.subtitleText.copyWith(
                  color: kBlackColor,
                  fontSize: AppDimensions.getHeight(13),
                ),
                children: [
                  TextSpan(
                    text: " Discount On Product",
                    style: AppStyles.subtitleText.copyWith(
                      color: Colors.blue,
                      fontSize: AppDimensions.getHeight(13),
                    ),
                  ),
                ],
              )),
              Text(
                "₹ 83.70",
                style: AppStyles.subtitleText.copyWith(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
