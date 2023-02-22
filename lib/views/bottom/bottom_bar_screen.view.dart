import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/views/cart/cart_screen.views.dart';
import 'package:project_one/views/favorite/favorites_screen.views.dart';
import 'package:project_one/views/home/home_screen.views.dart';
import 'package:project_one/views/orders/orders_screen.view.dart';
import 'package:project_one/widgets/custom_text_and_icon_widget.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int currentTab = 0;
  // final List<Widget> screens = [
  //   const HomeScreen(),
  //   const FavoritesScreen(),
  //   const CartScreen(),
  //   const MyOrdersScreen(),
  // ];

  final PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentIndex = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: currentTab == 2 ? kPrimaryColor : kWhiteColor,
          onPressed: () {
            setState(() {
              currentIndex = const CartScreen();
              currentTab = 2;
            });
          },
          child: Icon(
            Icons.shopping_cart,
            size: 30,
            color: currentTab == 2 ? kWhiteColor : kLightGreyColor,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageStorage(bucket: pageStorageBucket, child: currentIndex),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: AppDimensions.getHeight(60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = const HomeScreen();
                        currentTab = 0;
                      });
                    },
                    minWidth: AppDimensions.getWidth(50),
                    child: Center(
                      child: Icon(
                        Icons.home,
                        size: 30,
                        color:
                            currentTab == 0 ? kPrimaryColor : kLightGreyColor,
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = const FavoritesScreen();
                        currentTab = 1;
                      });
                    },
                    minWidth: AppDimensions.getWidth(50),
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        size: 30,
                        color:
                            currentTab == 1 ? kPrimaryColor : kLightGreyColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = const MyOrdersScreen();
                        currentTab = 3;
                      });
                    },
                    minWidth: AppDimensions.getWidth(50),
                    child: Center(
                      child: Icon(
                        Icons.shopping_bag,
                        size: 30,
                        color:
                            currentTab == 3 ? kPrimaryColor : kLightGreyColor,
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = buildBottomSheet() as Widget;
                        currentTab = 4;
                      });
                    },
                    minWidth: AppDimensions.getWidth(50),
                    child: Center(
                      child: Icon(
                        Icons.menu,
                        size: 30,
                        color:
                            currentTab == 4 ? kPrimaryColor : kLightGreyColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildBottomSheet() {
    return Get.bottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      persistent: false,
      Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {},
              child: const Icon(Icons.keyboard_arrow_down,
                  color: kBlackColor, size: 30),
            ),
            GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 11,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (_, index) {
                return CustomTextAndIconWidget(
                  icon: index == 0
                      ? Icons.account_circle
                      : index == 1
                          ? Icons.maps_home_work
                          : index == 2
                              ? Icons.question_mark
                              : index == 3
                                  ? Icons.privacy_tip
                                  : index == 4
                                      ? Icons.document_scanner_outlined
                                      : index == 5
                                          ? Icons.money
                                          : index == 6
                                              ? Icons.policy
                                              : index == 7
                                                  ? Icons.delivery_dining
                                                  : index == 8
                                                      ? Icons.account_balance
                                                      : index == 9
                                                          ? Icons.access_time
                                                          : Icons.logout,
                  text: index == 0
                      ? "Profile"
                      : index == 1
                          ? " My Address"
                          : index == 2
                              ? "About us"
                              : index == 3
                                  ? "Privacy Policy"
                                  : index == 4
                                      ? "Terms & Conditions"
                                      : index == 5
                                          ? "Refund Policy"
                                          : index == 6
                                              ? "Cancellation Policy"
                                              : index == 7
                                                  ? "Shipping Policy"
                                                  : index == 8
                                                      ? "Join as a Delivery man"
                                                      : index == 9
                                                          ? "Join as a Restaurant"
                                                          : "Sign in",
                  backgroudColor: index == 10 ? Colors.green : kPrimaryColor,
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
