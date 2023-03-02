import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/views/RestaurantNearTake/add_product_restaurant.dart';
import 'package:project_one/views/RestaurantNearTake/restaurant_addons_screen.dart';
import 'package:project_one/views/RestaurantNearTake/restaurant_bag_screen.dart';
import 'package:project_one/views/RestaurantNearTake/restaurant_bank_info_screen.dart';
import 'package:project_one/views/RestaurantNearTake/restaurant_categories_screen.dart';
import 'package:project_one/views/RestaurantNearTake/restaurant_earning_screen.dart';
import 'package:project_one/views/RestaurantNearTake/restaurant_expenses_report.dart';
import 'package:project_one/views/RestaurantNearTake/restaurant_home_screen.dart';
import 'package:project_one/views/RestaurantNearTake/restaurant_products_screen.dart';
import 'package:project_one/widgets/custom_text_and_icon_widget.dart';

import 'restaurant_profile_screen.dart';

class RestaurantBottomScreen extends StatefulWidget {
  const RestaurantBottomScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantBottomScreen> createState() => _RestaurantBottomScreenState();
}

class _RestaurantBottomScreenState extends State<RestaurantBottomScreen> {
  int currentTab = 0;
  // final List<Widget> screens = [
  //   const HomeScreen(),
  //   const FavoritesScreen(),
  //   const CartScreen(),
  //   const MyOrdersScreen(),
  // ];

  final PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentIndex = const RestaurantHomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: currentTab == 2 ? kPrimaryColor : kWhiteColor,
          onPressed: () {
            setState(() {
              currentIndex = const RestaurantProductsScreen();
              currentTab = 2;
            });
          },
          child: Icon(
            Icons.store,
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
                        currentIndex = const RestaurantHomeScreen();
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
                        currentIndex = const RestaurantBagScreen();
                        currentTab = 1;
                      });
                    },
                    minWidth: AppDimensions.getWidth(50),
                    child: Center(
                      child: Icon(
                        Icons.shopping_bag_rounded,
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
                        currentIndex = const RestaurantEarningScreen();
                        currentTab = 3;
                      });
                    },
                    minWidth: AppDimensions.getWidth(50),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.indianRupeeSign,
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

  Future<dynamic> buildBottomSheet() {
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
              onTap: () => Get.back(),
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
                          ? Icons.assured_workload_sharp
                          : index == 2
                              ? Icons.add_business_rounded
                              : index == 3
                                  ? Icons.add_box_outlined
                                  : index == 4
                                      ? Icons.category_outlined
                                      : index == 5
                                          ? Icons.discount
                                          : index == 6
                                              ? Icons.document_scanner_rounded
                                              : index == 7
                                                  ? Icons.policy_rounded
                                                  : index == 8
                                                      ? Icons
                                                          .dynamic_feed_outlined
                                                      : index == 9
                                                          ? Icons.chat_sharp
                                                          : Icons.logout,
                  text: index == 0
                      ? "Profile"
                      : index == 1
                          ? "Bank Info"
                          : index == 2
                              ? "Add Foods"
                              : index == 3
                                  ? "Addons"
                                  : index == 4
                                      ? "Categories"
                                      : index == 5
                                          ? "Coupons"
                                          : index == 6
                                              ? "Expense Report"
                                              : index == 7
                                                  ? "Privacy Policy"
                                                  : index == 8
                                                      ? "Terms & Conditions"
                                                      : index == 9
                                                          ? "Conversations"
                                                          : "Sign in",
                  backgroudColor: index == 10 ? Colors.green : kPrimaryColor,
                  onTap: index == 0
                      ? () {
                          //profile screen
                          Get.to(
                            () => const RestaurantProfileScreen(),
                          );
                        }
                      : index == 1
                          ? () {
                              Get.to(
                                () => const RestaurantBankInfoDetailScreen(),
                              );
                            }
                          : index == 2
                              ? () {
                                  // Add foods
                                  Get.to(
                                    () => const AddProductRestaurantScreen(),
                                  );
                                }
                              : index == 3
                                  ? () {
                                      //Add ons
                                      Get.to(
                                        () => const RestaurantAddOnsScreen(),
                                      );
                                    }
                                  : index == 4
                                      ? () {
                                          //category
                                          Get.to(
                                            () =>
                                                const RestaurantCategoryScreen(),
                                          );
                                        }
                                      : index == 5
                                          ? () {
                                              //coupons
                                            }
                                          : index == 6
                                              ? () {
                                                  // Expense Report
                                                  Get.to(
                                                    () =>
                                                        const RestaurantExpensesReport(),
                                                  );
                                                }
                                              : index == 7
                                                  ? () {
                                                      //Privacy policy
                                                    }
                                                  : index == 8
                                                      ? () {
                                                          // Terms and Conditions
                                                        }
                                                      : index == 9
                                                          ? () {
                                                              // Converstations
                                                            }
                                                          : () {
                                                              //sign in or sign out
                                                            },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
