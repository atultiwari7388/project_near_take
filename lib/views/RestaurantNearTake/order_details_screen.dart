import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/images.const.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import '../../constants/app_colors.constants.dart';
import '../../constants/dimensions.const.dart';
import '../../constants/styles.const.dart';

class OrderDetailsResScreen extends StatefulWidget {
  const OrderDetailsResScreen({super.key});

  @override
  State<OrderDetailsResScreen> createState() => _OrderDetailsResScreenState();
}

class _OrderDetailsResScreenState extends State<OrderDetailsResScreen> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbarSection(),
      body: buildBodySection(),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

//==================== Bottom Navigation Bar =================================
  Widget buildBottomNavigationBar(BuildContext context) {
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: [
            SizedBox(height: AppDimensions.getHeight(10)),
            SizedBox(
              height: AppDimensions.getHeight(50),
              child: SwipeableButtonView(
                isFinished: isFinished,
                onFinish: () {
                  Get.back();
                  Get.snackbar(
                    "Message",
                    "Your order is now ready for cooking",
                    backgroundColor: Colors.green,
                    colorText: kWhiteColor,
                  );
                },
                onWaitingProcess: () {
                  Future.delayed(const Duration(seconds: 3), () {
                    setState(() {
                      isFinished = true;
                    });
                  });
                },
                activeColor: kPrimaryColor,
                buttonWidget: const Icon(Icons.double_arrow_outlined),
                buttonText: "Swipe to Cooking",
              ),
            ),
            SizedBox(height: AppDimensions.getHeight(5)),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                elevation: 0,
                minimumSize: Size(
                  double.maxFinite,
                  AppDimensions.getHeight(45),
                ),
              ),
              onPressed: () => Get.snackbar(
                "Message",
                "Your Invoice is download",
                backgroundColor: Colors.green,
                colorText: kWhiteColor,
              ),
              label: Text(
                "Print Invoice",
                style: AppStyles.subtitleText.copyWith(
                    color: kWhiteColor, fontSize: AppDimensions.getHeight(16)),
              ),
              icon: const Icon(Icons.print),
            )
          ],
        ),
      ),
    );
  }

//=================== App Bar Section  ========================
  AppBar buildAppbarSection() {
    return AppBar(
      title: Text(
        "Order Details",
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
    );
  }

//=================== Body Section =============================
  Widget buildBodySection() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //for image or lottie asset

//=============== For need to deliver with in =====================================
            Center(
              child: Text(
                "Food need to deliver within",
                style: AppStyles.subtitleText.copyWith(
                  fontSize: AppDimensions.getHeight(15),
                ),
              ),
            ),
//========================= 30 - 40 Min ===========================================
            Center(
              child: RichText(
                text: TextSpan(
                  text: "30 - 40",
                  style: AppStyles.subtitleText.copyWith(
                    fontSize: AppDimensions.getHeight(17),
                    color: kBlackColor,
                  ),
                  children: [
                    TextSpan(
                      text: " Min",
                      style: AppStyles.subtitleText.copyWith(
                        fontSize: AppDimensions.getHeight(17),
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: AppDimensions.getHeight(10)),
//======================== Order Id and time section  =============================
            Row(
              children: [
                Text(
                  "Order ID: 100068",
                  style: AppStyles.subtitleText.copyWith(
                    fontSize: AppDimensions.getHeight(15),
                    color: kBlackColor,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.watch_later, color: kLightGreyColor),
                SizedBox(width: AppDimensions.getWidth(6)),
                Text(
                  "11 Jan 2022 13:53",
                  style: AppStyles.subtitleText.copyWith(
                    fontSize: AppDimensions.getHeight(15),
                    color: kBlackColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimensions.getHeight(10)),
//======================== Delivery Done  =========================================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery",
                  style: AppStyles.subtitleText.copyWith(
                    fontSize: AppDimensions.getHeight(15),
                    color: kBlackColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(AppDimensions.getHeight(10)),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.17),
                    borderRadius:
                        BorderRadius.circular(AppDimensions.getHeight(12)),
                  ),
                  child: Center(
                    child: Text(
                      "Digital Payment",
                      style: AppStyles.subtitleText.copyWith(
                        fontSize: AppDimensions.getHeight(12),
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            SizedBox(height: AppDimensions.getHeight(10)),
//======================== Item and Confirm Section  ==============================
            Row(
              children: [
                Text(
                  "Item:",
                  style: AppStyles.subtitleText.copyWith(
                    fontSize: AppDimensions.getHeight(15),
                    color: kBlackColor,
                  ),
                ),
                SizedBox(width: AppDimensions.getWidth(2)),
                Text(
                  "1",
                  style: AppStyles.subtitleText.copyWith(
                    fontSize: AppDimensions.getHeight(15),
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  height: AppDimensions.getHeight(7),
                  width: AppDimensions.getWidth(7),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: AppDimensions.getWidth(3)),
                Text(
                  "Confirmed",
                  style: AppStyles.subtitleText.copyWith(
                    fontSize: AppDimensions.getHeight(13),
                    color: kBlackColor,
                  ),
                ),
              ],
            ),
            const Divider(),
            SizedBox(height: AppDimensions.getHeight(10)),
//========================  Item image and quantity  ==============================
            Row(
              children: [
                // Image section
                Container(
                  height: AppDimensions.getHeight(50),
                  width: AppDimensions.getWidth(60),
                  decoration: BoxDecoration(
                    color: kRedColor,
                    borderRadius:
                        BorderRadius.circular(AppDimensions.getHeight(10)),
                    image: const DecorationImage(
                      image: AssetImage(pizzaImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: AppDimensions.getWidth(10)),
                // Item name && price section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pizza",
                      style: AppStyles.subtitleText.copyWith(
                        fontSize: AppDimensions.getHeight(15),
                        color: kBlackColor,
                      ),
                    ),
                    Text(
                      "₹ 130.00",
                      style: AppStyles.subtitleText.copyWith(
                        fontSize: AppDimensions.getHeight(15),
                        color: kBlackColor,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Quantity :",
                          style: AppStyles.subtitleText.copyWith(
                            fontSize: AppDimensions.getHeight(15),
                            color: kBlackColor,
                          ),
                        ),
                        SizedBox(width: AppDimensions.getWidth(1)),
                        Text(
                          "1",
                          style: AppStyles.subtitleText.copyWith(
                            fontSize: AppDimensions.getHeight(15),
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: AppDimensions.getHeight(7),
                      width: AppDimensions.getWidth(7),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: AppDimensions.getWidth(3)),
                    Text(
                      "Non-Veg",
                      style: AppStyles.subtitleText.copyWith(
                        fontSize: AppDimensions.getHeight(13),
                        color: kBlackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            SizedBox(height: AppDimensions.getHeight(10)),
//======================= Customer Details =========================================
            Text(
              "Customer Details",
              style: AppStyles.subtitleText.copyWith(
                  fontSize: AppDimensions.getHeight(16), color: kBlackColor),
            ),
            SizedBox(height: AppDimensions.getHeight(10)),
            Row(
              children: [
                //customer Profile section
                CircleAvatar(
                  radius: AppDimensions.getHeight(24),
                  backgroundColor: kRedColor,
                ),
                SizedBox(width: AppDimensions.getWidth(10)),
                //customer name and address
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sachin Tendulkar",
                        style: AppStyles.subtitleText
                            .copyWith(color: kBlackColor)),
                    Text("Mumbai ,India ", style: AppStyles.subtitleText)
                  ],
                ),
              ],
            ),
            SizedBox(height: AppDimensions.getHeight(30)),
//======================  Items and price section  ==================================

            const ReusableRowResWidget(
                firstText: "Item Price", secondText: "₹ 95.00"),

            const ReusableRowResWidget(
                firstText: "Addons", secondText: "(+) ₹ 0.00"),
            const Divider(),

            const ReusableRowResWidget(
                firstText: "Subtotal", secondText: "(+) ₹ 95.00"),

            const ReusableRowResWidget(
                firstText: "Discount", secondText: "(+) ₹ 0.00"),

            const ReusableRowResWidget(
                firstText: "Delivery man tips", secondText: "(+) ₹ 0.00"),

            const ReusableRowResWidget(
                firstText: "Vat/Tax", secondText: "(+) ₹ 19.78"),

            const ReusableRowResWidget(
                firstText: "Discount", secondText: "(+) ₹ 50.00"),
            SizedBox(height: AppDimensions.getHeight(10)),
            const Divider(),
            const ReusableRowResWidget(
              firstText: "Total Amount",
              secondText: "(+) ₹ 50.00",
              firstTextColor: kPrimaryColor,
              secondTextColor: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableRowResWidget extends StatelessWidget {
  const ReusableRowResWidget({
    super.key,
    required this.firstText,
    required this.secondText,
    this.firstTextColor = kBlackColor,
    this.secondTextColor = kLightGreyColor,
  });

  final String firstText, secondText;
  final Color firstTextColor, secondTextColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppDimensions.getHeight(5.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(firstText,
              style: AppStyles.subtitleText.copyWith(color: firstTextColor)),
          Text(secondText,
              style: AppStyles.subtitleText.copyWith(color: secondTextColor)),
        ],
      ),
    );
  }
}
