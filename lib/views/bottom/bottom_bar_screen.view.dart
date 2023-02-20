import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/views/cart/cart_screen.views.dart';
import 'package:project_one/views/favorite/favorites_screen.views.dart';
import 'package:project_one/views/home/home_screen.views.dart';
import 'package:project_one/views/orders/orders_screen.view.dart';

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
          backgroundColor: kWhiteColor,
          onPressed: () {
            setState(() {
              currentIndex = const CartScreen();
              currentTab = 2;
            });
          },
          child: Icon(
            Icons.shopping_cart,
            size: 30,
            color: currentTab == 2 ? kPrimaryColor : kLightGreyColor,
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
      Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
