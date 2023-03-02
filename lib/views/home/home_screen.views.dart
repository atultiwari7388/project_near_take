import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/images.const.dart';
import 'package:project_one/constants/strings.const.dart';
import 'package:project_one/constants/styles.const.dart';
import 'package:project_one/views/home/components/category_details_screen.dart';
import 'package:project_one/views/home/components/restaurant_detail_screen.views.dart';
import 'package:project_one/views/home/components/view_all_category.dart';
import '../../constants/app_colors.constants.dart';
import '../../widgets/global_var.widgets.dart';
import '../cart/cart_screen.views.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

//============= for image Slider  ===========================
  List<Widget> items = [
    Container(
      decoration: BoxDecoration(
        color: kLightGreyColor.withOpacity(0.24),
        image: const DecorationImage(
            image: AssetImage(sliderOne), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: kLightGreyColor.withOpacity(0.24),
        image: const DecorationImage(
            image: AssetImage(sliderTwo), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  ];

  ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(
        () {
          setState(
            () {
              if (_scrollController.offset >= 300) {
                _showBackToTopButton = true; // show the back-to-top button
              } else {
                _showBackToTopButton = false; // hide the back-to-top button
              }
            },
          );
        },
      );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _showBackToTopButton == false
            ? null
            : FloatingActionButton(
                backgroundColor: kPrimaryColor,
                onPressed: _scrollToTop,
                child: const Icon(Icons.arrow_upward),
              ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              expandedHeight: AppDimensions.getHeight(100),
              backgroundColor: kWhiteColor,
              title: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.location_on, color: kBlackColor),
                  Text("Sco 20,Old Kalka Rd, Dhakoli ,Haryana",
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.subtitleText
                          .copyWith(color: kBlackColor, fontSize: 15)),
                  const Icon(Icons.arrow_drop_down, color: kBlackColor),
                  const Icon(Icons.notifications, color: kBlackColor),
                ],
              ),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Padding(
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
                                hintText: findYourBestItems,
                                filled: true,
                                fillColor: kLightGreyColor.withOpacity(0.24),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppDimensions.getWidth(12)),
                                prefixIcon: const Icon(Icons.search,
                                    color: kPrimaryColor),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: kWhiteColor),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: kShadowColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
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
                  )),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                    left: AppDimensions.getWidth(8),
                    right: AppDimensions.getWidth(8)),
                child: Column(
                  children: [
                    SizedBox(height: AppDimensions.getHeight(20)),
                    //==================== banner slider ==============================
                    SizedBox(
                      height: AppDimensions.getHeight(150),
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return CarouselSlider(
                            items: items,
                            options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 0.9,
                              aspectRatio: 16 / 9,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeFactor: 0.3,
                              initialPage: _currentIndex,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: AppDimensions.getHeight(8)),
//=================== dots indicator ==============================
                    SizedBox(height: AppDimensions.getHeight(10)),
//=================== categories Section ==========================
                    ReusableRowWidget(
                        firstText: category,
                        secondText: view,
                        onTap: () =>
                            Get.to(() => const ViewAllCategorySection())),
                    SizedBox(height: AppDimensions.getHeight(10)),
//================== category name and image  ======================
                    SizedBox(
                      height: AppDimensions.getHeight(104),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: Globalvariable.categoryItems.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          final categoryData =
                              Globalvariable.categoryItems[index];
                          return Padding(
                            padding: EdgeInsets.only(
                                right: AppDimensions.getWidth(6)),
                            child: CategoryCard(
                              icon: categoryData["image"]!,
                              title: categoryData["title"]!,
                              onTap: () =>
                                  Get.to(() => const CategoryDetailsScreen()),
                            ),
                          );
                        },
                      ),
                    ),
//================== Restaurant Section  ===========================
                    SizedBox(height: AppDimensions.getHeight(15)),
                    ReusableRowWidget(
                        firstText: popularRes, secondText: view, onTap: () {}),
                    SizedBox(height: AppDimensions.getHeight(15)),
                    SizedBox(
                      height: AppDimensions.getHeight(175),
                      // color: kRedColor,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            Globalvariable.popularRestaurantsItems.length,
                        itemBuilder: (_, index) {
                          final resData =
                              Globalvariable.popularRestaurantsItems[index];
                          return RestaurantCard(
                            image: resData["image"]!,
                            title: resData["name"]!,
                            onTap: () => Get.to(() => RestaurantDetailsScreen(
                                  resImage: resData['image']!,
                                  title: resData["name"]!,
                                )),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: AppDimensions.getHeight(15)),
//================= Find near by restaurant new  ============================
                    Container(
                      height: AppDimensions.getHeight(100),
                      decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //icon section
                          const FaIcon(FontAwesomeIcons.locationArrow),
                          SizedBox(width: AppDimensions.getWidth(15)),
                          //text section
                          Text(
                            "Find Nearby\nRestaurant Near You",
                            style: AppStyles.subtitleText
                                .copyWith(color: kBlackColor),
                          ),
                          SizedBox(width: AppDimensions.getWidth(15)),

                          //button section
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 1, backgroundColor: kPrimaryColor),
                              onPressed: () {},
                              child: Text("See Location",
                                  style: AppStyles.subtitleText.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: kWhiteColor)))
                        ],
                      ),
                    ),
                    SizedBox(height: AppDimensions.getHeight(15)),
//================ Trending Food Offers ==================================
                    ReusableRowWidget(
                        firstText: trendingFoodOff,
                        secondText: view,
                        onTap: () {}),
                    SizedBox(height: AppDimensions.getHeight(15)),
                    SizedBox(
                      height: AppDimensions.getHeight(175),
                      // color: kRedColor,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          return TrendingFoodOfferCard(
                            onTap: () {
                              buildAddToCartBottomSheet();
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: AppDimensions.getHeight(15)),
//==================== Cuisines  ===============================
                    // ReusableRowWidget(
                    //     firstText: cuisines,
                    //     secondText: "View All",
                    //     onTap: () =>
                    //         Get.to(() => const ViewAllCuisinesSection())),
                    // SizedBox(height: AppDimensions.getHeight(5)),
                    // SizedBox(
                    //   height: AppDimensions.getHeight(150),
                    //   child: GridView.builder(
                    //       shrinkWrap: true,
                    //       physics: const NeverScrollableScrollPhysics(),
                    //       itemCount: Globalvariable.categoryItems.length,
                    //       gridDelegate:
                    //           const SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 4,
                    //         mainAxisSpacing: 1,
                    //         childAspectRatio: 3.5 / 5,
                    //       ),
                    //       itemBuilder: (ctx, index) {
                    //         final categoryData =
                    //             Globalvariable.categoryItems[index];
                    //         return Padding(
                    //           padding: EdgeInsets.only(
                    //               right: AppDimensions.getWidth(6)),
                    //           child: CategoryCard(
                    //             icon: categoryData["image"]!,
                    //             title: categoryData["title"]!,
                    //             onTap: () => Get.to(() =>
                    //                 CuisinesFoodDetailsScreen(
                    //                     appBarTitle: categoryData["title"]!,
                    //                     resImage: categoryData["image"]!)),
                    //           ),
                    //         );
                    //       }),
                    // ),

//=================== Popular Food Near By  ======================
                    ReusableRowWidget(
                        firstText: popularFoodNear,
                        secondText: view,
                        onTap: () {}),
                    SizedBox(height: AppDimensions.getHeight(15)),
                    SizedBox(
                      height: AppDimensions.getHeight(120),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: Globalvariable.popularFoodsItems.length,
                        itemBuilder: (_, index) {
                          final data = Globalvariable.popularFoodsItems[index];
                          return PopularFoodNearBy(
                            onTap: () {
                              Get.bottomSheet(
                                persistent: false,
                                isScrollControlled: true,
                                ignoreSafeArea: true,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //tap to close
                                      InkWell(
                                        onTap: () => Get.back(),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: CircleAvatar(
                                            radius: 25,
                                            backgroundColor: kPrimaryColor,
                                            child: Text(
                                              "X",
                                              style: AppStyles.subtitleText
                                                  .copyWith(color: kWhiteColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // image section
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.getHeight(8)),
                                        padding: EdgeInsets.only(
                                            left: AppDimensions.getWidth(8)),
                                        // width: AppDimensions.getWidth(280),
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            color: kWhiteColor,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Row(
                                          children: [
                                            //image section
                                            Stack(
                                              children: [
                                                Container(
                                                  width: AppDimensions.getWidth(
                                                      100),
                                                  height:
                                                      AppDimensions.getHeight(
                                                          100),
                                                  decoration: BoxDecoration(
                                                      // color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              data["image"]!),
                                                          fit: BoxFit.cover)),
                                                ),
                                                Positioned(
                                                  top: AppDimensions.getHeight(
                                                      15),
                                                  child: Container(
                                                    height:
                                                        AppDimensions.getHeight(
                                                            20),
                                                    width:
                                                        AppDimensions.getWidth(
                                                            60),
                                                    decoration: BoxDecoration(
                                                      color: kPrimaryColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(
                                                                AppDimensions
                                                                    .getHeight(
                                                                        10)),
                                                        bottomRight:
                                                            Radius.circular(
                                                                AppDimensions
                                                                    .getHeight(
                                                                        10)),
                                                      ),
                                                    ),
                                                    child: Center(
                                                        child: Text("15% Off",
                                                            style: AppStyles
                                                                .subtitleText
                                                                .copyWith(
                                                                    color:
                                                                        kWhiteColor,
                                                                    fontSize:
                                                                        13))),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            //text Section
                                            Container(
                                              height:
                                                  AppDimensions.getHeight(120),
                                              padding: const EdgeInsets.all(3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ReusableTextWidgetRes(
                                                      text: data["name"]!,
                                                      color: kBlackColor,
                                                      fontSize: 15),
                                                  SizedBox(
                                                      height: AppDimensions
                                                          .getHeight(5)),
                                                  const ReusableTextWidgetRes(
                                                      text: "Hungry puppets",
                                                      color: kDarkGreyColor,
                                                      fontSize: 15),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: AppDimensions
                                                            .getWidth(7)),
                                                    child: Row(
                                                      children: [
                                                        Row(
                                                          children: List.generate(
                                                              5,
                                                              (index) => const Icon(
                                                                  Icons.star,
                                                                  color:
                                                                      kPrimaryColor,
                                                                  size: 18)),
                                                        ),
                                                        SizedBox(
                                                            width: AppDimensions
                                                                .getWidth(3)),
                                                        const Text("(12)"),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: AppDimensions
                                                          .getHeight(5)),
                                                  //price section
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Row(
                                                      children: const [
                                                        FaIcon(
                                                            FontAwesomeIcons
                                                                .indianRupeeSign,
                                                            size: 12),
                                                        Text("120"),
                                                      ],
                                                    ),
                                                  ),
                                                  //price drop section
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Row(
                                                      children: [
                                                        const FaIcon(
                                                          FontAwesomeIcons
                                                              .indianRupeeSign,
                                                          size: 12,
                                                          color: kGreyColor,
                                                        ),
                                                        Text("120",
                                                            style: AppStyles
                                                                .subtitleText
                                                                .copyWith(
                                                                    color:
                                                                        kGreyColor,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //details section
                                      Flexible(child: Container()),
                                      //bottom section
                                      Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: kWhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: kPrimaryColor),
                                            ),
                                            child: const Icon(
                                                Icons.shopping_cart,
                                                color: kPrimaryColor),
                                          ),
                                          SizedBox(
                                              width:
                                                  AppDimensions.getWidth(10)),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: kPrimaryColor,
                                                elevation: 1,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Text(
                                                  "Order now",
                                                  style: AppStyles.subtitleText
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: kWhiteColor,
                                                          fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            title: data["name"]!,
                            image: data["image"]!,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: AppDimensions.getHeight(15)),
//================== New On App Name food  =======================
                    ReusableRowWidget(
                        firstText: "New on Near Take",
                        secondText: "View All",
                        onTap: () {}),
                    SizedBox(height: AppDimensions.getHeight(15)),
                    SizedBox(
                      height: AppDimensions.getHeight(175),
                      // color: kRedColor,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            Globalvariable.popularRestaurantsItems.length,
                        itemBuilder: (_, index) {
                          final resData =
                              Globalvariable.popularRestaurantsItems[index];
                          return RestaurantCard(
                            image: resData["image"]!,
                            title: resData["name"]!,
                            onTap: () => Get.to(() => RestaurantDetailsScreen(
                                  resImage: resData['image']!,
                                  title: resData["name"]!,
                                )),
                          );
                        },
                      ),
                    ),
//=================  Best Review Food ===========================
                    ReusableRowWidget(
                        firstText: "Best Review Food",
                        secondText: "View All",
                        onTap: () {}),
                    SizedBox(height: AppDimensions.getHeight(15)),
                    SizedBox(
                      height: AppDimensions.getHeight(120),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: Globalvariable.popularFoodsItems.length,
                        itemBuilder: (_, index) {
                          final popularFoodData =
                              Globalvariable.popularFoodsItems[index];
                          return PopularFoodNearBy(
                            onTap: () {
                              Get.bottomSheet(
                                persistent: false,
                                isScrollControlled: true,
                                ignoreSafeArea: true,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //tap to close
                                      InkWell(
                                        onTap: () => Get.back(),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: CircleAvatar(
                                            radius: 25,
                                            backgroundColor: kPrimaryColor,
                                            child: Text(
                                              "X",
                                              style: AppStyles.subtitleText
                                                  .copyWith(color: kWhiteColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // image section
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.getHeight(8)),
                                        padding: EdgeInsets.only(
                                            left: AppDimensions.getWidth(8)),
                                        // width: AppDimensions.getWidth(280),
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            color: kWhiteColor,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Row(
                                          children: [
                                            //image section
                                            Stack(
                                              children: [
                                                Container(
                                                  width: AppDimensions.getWidth(
                                                      100),
                                                  height:
                                                      AppDimensions.getHeight(
                                                          100),
                                                  decoration: BoxDecoration(
                                                      // color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              popularFoodData[
                                                                  "image"]!),
                                                          fit: BoxFit.cover)),
                                                ),
                                                Positioned(
                                                  top: AppDimensions.getHeight(
                                                      15),
                                                  child: Container(
                                                    height:
                                                        AppDimensions.getHeight(
                                                            20),
                                                    width:
                                                        AppDimensions.getWidth(
                                                            60),
                                                    decoration: BoxDecoration(
                                                      color: kPrimaryColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(
                                                                AppDimensions
                                                                    .getHeight(
                                                                        10)),
                                                        bottomRight:
                                                            Radius.circular(
                                                                AppDimensions
                                                                    .getHeight(
                                                                        10)),
                                                      ),
                                                    ),
                                                    child: Center(
                                                        child: Text("15% Off",
                                                            style: AppStyles
                                                                .subtitleText
                                                                .copyWith(
                                                                    color:
                                                                        kWhiteColor,
                                                                    fontSize:
                                                                        13))),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            //text Section
                                            Container(
                                              height:
                                                  AppDimensions.getHeight(120),
                                              padding: const EdgeInsets.all(3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ReusableTextWidgetRes(
                                                      text: popularFoodData[
                                                          "name"]!,
                                                      color: kBlackColor,
                                                      fontSize: 15),
                                                  SizedBox(
                                                      height: AppDimensions
                                                          .getHeight(5)),
                                                  const ReusableTextWidgetRes(
                                                      text: "Hungry puppets",
                                                      color: kDarkGreyColor,
                                                      fontSize: 15),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: AppDimensions
                                                            .getWidth(7)),
                                                    child: Row(
                                                      children: [
                                                        Row(
                                                          children: List.generate(
                                                              5,
                                                              (index) => const Icon(
                                                                  Icons.star,
                                                                  color:
                                                                      kPrimaryColor,
                                                                  size: 18)),
                                                        ),
                                                        SizedBox(
                                                            width: AppDimensions
                                                                .getWidth(3)),
                                                        const Text("(12)"),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: AppDimensions
                                                          .getHeight(5)),
                                                  //price section
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Row(
                                                      children: const [
                                                        FaIcon(
                                                            FontAwesomeIcons
                                                                .indianRupeeSign,
                                                            size: 12),
                                                        Text("120"),
                                                      ],
                                                    ),
                                                  ),
                                                  //price drop section
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Row(
                                                      children: [
                                                        const FaIcon(
                                                          FontAwesomeIcons
                                                              .indianRupeeSign,
                                                          size: 12,
                                                          color: kGreyColor,
                                                        ),
                                                        Text("120",
                                                            style: AppStyles
                                                                .subtitleText
                                                                .copyWith(
                                                                    color:
                                                                        kGreyColor,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //details section
                                      Flexible(child: Container()),
                                      //bottom section
                                      Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: kWhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: kPrimaryColor),
                                            ),
                                            child: const Icon(
                                                Icons.shopping_cart,
                                                color: kPrimaryColor),
                                          ),
                                          SizedBox(
                                              width:
                                                  AppDimensions.getWidth(10)),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: kPrimaryColor,
                                                elevation: 1,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Text(
                                                  "Order now",
                                                  style: AppStyles.subtitleText
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: kWhiteColor,
                                                          fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            image: popularFoodData["image"]!,
                            title: popularFoodData["name"]!,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: AppDimensions.getHeight(15)),
//==================  All Restaurants  =============================
                    ReusableRowWidget(
                        firstText: "All Restaurants",
                        secondText: "View All",
                        onTap: () {}),
                    SizedBox(height: AppDimensions.getHeight(15)),
                    Container(
                      margin: EdgeInsets.only(
                        left: AppDimensions.getHeight(8),
                        // top: AppDimensions.getHeight(12),
                      ),
                      height: AppDimensions.getHeight(600),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (_, index) {
                            return const AllRestaurants();
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//==================  Add to cart bottom sheet  ===================
  Future<dynamic> buildAddToCartBottomSheet() {
    return Get.bottomSheet(
      persistent: false,
      isScrollControlled: true,
      ignoreSafeArea: true,
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //tap to close
            InkWell(
              onTap: () => Get.back(),
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: kPrimaryColor,
                  child: Text(
                    "X",
                    style: AppStyles.subtitleText.copyWith(color: kWhiteColor),
                  ),
                ),
              ),
            ),
            // image section
            Container(
              margin: EdgeInsets.only(left: AppDimensions.getHeight(8)),
              padding: EdgeInsets.only(left: AppDimensions.getWidth(8)),
              // width: AppDimensions.getWidth(280),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  //image section
                  Stack(
                    children: [
                      Container(
                        width: AppDimensions.getWidth(100),
                        height: AppDimensions.getHeight(100),
                        decoration: BoxDecoration(
                            // color: Colors.green,
                            borderRadius: BorderRadius.circular(7),
                            image: const DecorationImage(
                                image: AssetImage(pizzaImg),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        top: AppDimensions.getHeight(15),
                        child: Container(
                          height: AppDimensions.getHeight(20),
                          width: AppDimensions.getWidth(60),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                              topRight:
                                  Radius.circular(AppDimensions.getHeight(10)),
                              bottomRight:
                                  Radius.circular(AppDimensions.getHeight(10)),
                            ),
                          ),
                          child: Center(
                              child: Text("15% Off",
                                  style: AppStyles.subtitleText.copyWith(
                                      color: kWhiteColor, fontSize: 13))),
                        ),
                      ),
                    ],
                  ),
                  //text Section
                  Container(
                    height: AppDimensions.getHeight(120),
                    padding: const EdgeInsets.all(3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ReusableTextWidgetRes(
                            text: "Pizza", color: kBlackColor, fontSize: 15),
                        SizedBox(height: AppDimensions.getHeight(5)),
                        const ReusableTextWidgetRes(
                            text: "Hungry puppets",
                            color: kDarkGreyColor,
                            fontSize: 15),
                        Padding(
                          padding:
                              EdgeInsets.only(left: AppDimensions.getWidth(7)),
                          child: Row(
                            children: [
                              Row(
                                children: List.generate(
                                    5,
                                    (index) => const Icon(Icons.star,
                                        color: kPrimaryColor, size: 18)),
                              ),
                              SizedBox(width: AppDimensions.getWidth(3)),
                              const Text("(12)"),
                            ],
                          ),
                        ),
                        SizedBox(height: AppDimensions.getHeight(5)),
                        //price section
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: const [
                              FaIcon(FontAwesomeIcons.indianRupeeSign,
                                  size: 12),
                              Text("120"),
                            ],
                          ),
                        ),
                        //price drop section
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.indianRupeeSign,
                                size: 12,
                                color: kGreyColor,
                              ),
                              Text("120",
                                  style: AppStyles.subtitleText.copyWith(
                                      color: kGreyColor,
                                      decoration: TextDecoration.lineThrough)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppDimensions.getHeight(20)),
            //details section
            Text("Description",
                style: AppStyles.subtitleText.copyWith(
                  color: kBlackColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: AppDimensions.getHeight(10)),
            Text(
              "Spicy chilli crab is only mildly spicy and is often described as having a flavour that's both sweet and savoury. The crab is divine but the sauce is the star - sweet yet savoury, slightly spicy and supremely",
              style: AppStyles.subtitleText.copyWith(fontSize: 14),
            ),
            SizedBox(height: AppDimensions.getHeight(10)),

            //capacity section
            Row(
              children: [
                Text(
                  "Capacity",
                  style: AppStyles.subtitleText.copyWith(
                    color: kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "(Required)",
                  style: AppStyles.subtitleText.copyWith(
                    color: kPrimaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            RadioListTile(
                title: Text("1:1 Person"),
                value: "1:2 Person",
                groupValue: "1 Person",
                onChanged: (value) {}),
            RadioListTile(
                title: Text("1:2 Person"),
                value: "1:2 Person",
                groupValue: "1 Person",
                onChanged: (value) {}),
            RadioListTile(
              title: Text("1:5 Person"),
              value: "1:5 Person",
              groupValue: "1 Person",
              onChanged: (value) {},
            ),
            //Addition(optional),
            //Quantity section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Quantity"),
                Row(
                  children: [
                    ReusableIncrementAndDecrementWidget(
                      onTap: () {},
                      text: "-",
                    ),
                    SizedBox(width: AppDimensions.getWidth(10)),
                    Text("1"),
                    SizedBox(width: AppDimensions.getWidth(10)),
                    ReusableIncrementAndDecrementWidget(
                      onTap: () {},
                      text: "+",
                      backgroundColor: kPrimaryColor,
                    ),
                  ],
                ),
              ],
            ),
            //total amount
            SizedBox(height: AppDimensions.getHeight(20)),
            //bottom section
            Row(
              children: [
                Container(
                  height: AppDimensions.getHeight(50),
                  width: AppDimensions.getWidth(60),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kPrimaryColor),
                  ),
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.home, color: kPrimaryColor),
                  ),
                ),
                SizedBox(width: AppDimensions.getWidth(10)),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const CartScreen()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Order now",
                        style: AppStyles.subtitleText.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kWhiteColor,
                            fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//================ All restaurants =================

class AllRestaurants extends StatelessWidget {
  const AllRestaurants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: AppDimensions.getHeight(8),top: AppDimensions.getHeight(12)),
      decoration: BoxDecoration(
          color: kGreyColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(3)),
      child: Row(
        children: [
          //image section
          Stack(
            children: [
              Container(
                width: AppDimensions.getWidth(120),
                height: AppDimensions.getHeight(100),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ],
          ),
          //text Section
          Expanded(
            child: Container(
              height: AppDimensions.getHeight(110),
              // width: AppDimensions.getWidth(230),
              padding: const EdgeInsets.all(3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppDimensions.getHeight(10)),
                  const ReusableTextWidgetRes(
                      text: "Meat Pizza", color: kBlackColor, fontSize: 15),
                  SizedBox(height: AppDimensions.getHeight(5)),
                  const ReusableTextWidgetRes(
                      text: "location 0,0,0",
                      color: kDarkGreyColor,
                      fontSize: 15),
                  Padding(
                    padding: EdgeInsets.only(left: AppDimensions.getWidth(7)),
                    child: Row(
                      children: [
                        Row(
                          children: List.generate(
                              5,
                              (index) => const Icon(Icons.star,
                                  color: kPrimaryColor, size: 18)),
                        ),
                        SizedBox(width: AppDimensions.getWidth(3)),
                        const Text("(12)"),
                      ],
                    ),
                  ),
                  SizedBox(height: AppDimensions.getHeight(15)),
                  const Divider(color: kDarkGreyColor),
                  // SizedBox(height: 5),
                ],
              ),
            ),
          ),
          //favorite section
          InkWell(
              onTap: () {},
              child:
                  const FaIcon(FontAwesomeIcons.heart, color: kLightGreyColor)),
          SizedBox(width: AppDimensions.getWidth(10)),
        ],
      ),
    );
  }
}

//================= popular Food Near By ====================

class PopularFoodNearBy extends StatelessWidget {
  const PopularFoodNearBy(
      {Key? key, required this.title, required this.image, required this.onTap})
      : super(key: key);

  final String title, image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: AppDimensions.getHeight(8)),
        padding: EdgeInsets.only(left: AppDimensions.getWidth(8)),
        width: AppDimensions.getWidth(280),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            //image section
            Stack(
              children: [
                Container(
                  width: AppDimensions.getWidth(100),
                  height: AppDimensions.getHeight(100),
                  decoration: BoxDecoration(
                      // color: Colors.green,
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
                Positioned(
                  top: AppDimensions.getHeight(15),
                  child: Container(
                    height: AppDimensions.getHeight(20),
                    width: AppDimensions.getWidth(60),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppDimensions.getHeight(10)),
                        bottomRight:
                            Radius.circular(AppDimensions.getHeight(10)),
                      ),
                    ),
                    child: Center(
                        child: Text("15% Off",
                            style: AppStyles.subtitleText
                                .copyWith(color: kWhiteColor, fontSize: 13))),
                  ),
                ),
              ],
            ),
            //text Section
            Container(
              height: AppDimensions.getHeight(100),
              padding: const EdgeInsets.all(3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableTextWidgetRes(
                      text: title, color: kBlackColor, fontSize: 15),
                  SizedBox(height: AppDimensions.getHeight(5)),
                  const ReusableTextWidgetRes(
                      text: "Hungry puppets",
                      color: kDarkGreyColor,
                      fontSize: 15),
                  Padding(
                    padding: EdgeInsets.only(left: AppDimensions.getWidth(7)),
                    child: Row(
                      children: [
                        Row(
                          children: List.generate(
                              5,
                              (index) => const Icon(Icons.star,
                                  color: kPrimaryColor, size: 18)),
                        ),
                        SizedBox(width: AppDimensions.getWidth(3)),
                        const Text("(12)"),
                      ],
                    ),
                  ),
                  SizedBox(height: AppDimensions.getHeight(5)),
                  Padding(
                    padding: EdgeInsets.only(left: AppDimensions.getWidth(7)),
                    child: Row(
                      children: [
                        Row(
                          children: const [
                            FaIcon(FontAwesomeIcons.indianRupeeSign, size: 12),
                            Text("120"),
                          ],
                        ),
                        SizedBox(width: AppDimensions.getWidth(10)),
                        Row(
                          children: [
                            const FaIcon(FontAwesomeIcons.indianRupeeSign,
                                size: 12, color: kDarkGreyColor),
                            Text("190",
                                style: AppStyles.subtitleText.copyWith(
                                    fontSize: 15,
                                    decoration: TextDecoration.lineThrough)),
                          ],
                        ),
                        SizedBox(width: AppDimensions.getWidth(50)),
                        InkWell(
                          onTap: () {},
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//================= category card  ================================
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    // required this.backgroundColor,
  }) : super(key: key);

  final String icon, title;
  final VoidCallback onTap;

  // final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.getWidth(10),
          vertical: AppDimensions.getHeight(5),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(AppDimensions.getHeight(5)),
              height: AppDimensions.getHeight(60),
              width: AppDimensions.getWidth(60),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                      image: AssetImage(icon), fit: BoxFit.cover)),
              // child: Center(
              //     child: Image.asset(icon,
              //         height: AppDimensions.getHeight(40),
              //         width: AppDimensions.getWidth(40),
              //         fit: BoxFit.contain)),
            ),
            SizedBox(height: AppDimensions.getHeight(10)),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}

//================  restaurants card  =============================

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    required this.onTap,
    required this.image,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: AppDimensions.getWidth(220),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // using stack
            Stack(
              children: [
                //image section
                Container(
                  height: AppDimensions.getHeight(100),
                  width: AppDimensions.getWidth(220),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppDimensions.getHeight(12)),
                        topRight: Radius.circular(AppDimensions.getHeight(12)),
                      )),
                ),
                //15 % off or free delivery
                Positioned(
                  top: AppDimensions.getHeight(15),
                  child: Container(
                    height: AppDimensions.getHeight(20),
                    width: AppDimensions.getWidth(60),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppDimensions.getHeight(10)),
                        bottomRight:
                            Radius.circular(AppDimensions.getHeight(10)),
                      ),
                    ),
                    child: Center(
                        child: Text("15% Off",
                            style: AppStyles.subtitleText
                                .copyWith(color: kWhiteColor, fontSize: 13))),
                  ),
                ),
                // favorite section
                Positioned(
                  right: AppDimensions.getWidth(8),
                  top: AppDimensions.getHeight(8),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: AppDimensions.getHeight(35),
                      width: AppDimensions.getWidth(35),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                          child: FaIcon(FontAwesomeIcons.heart,
                              color: kLightGreyColor)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimensions.getHeight(10)),
            //for title , location and ratings
            ReusableTextWidgetRes(
                text: title, color: kBlackColor, fontSize: 16),
            const ReusableTextWidgetRes(
                text: "House: 00, Road:00, Chandigarh",
                color: kDarkGreyColor,
                fontSize: 12),
            Padding(
              padding: EdgeInsets.only(left: AppDimensions.getWidth(7)),
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                        5,
                        (index) => const Icon(Icons.star,
                            color: kPrimaryColor, size: 18)),
                  ),
                  SizedBox(width: AppDimensions.getWidth(3)),
                  const Text("(12)"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//================ Trending Food Offers Card ======================

class TrendingFoodOfferCard extends StatelessWidget {
  const TrendingFoodOfferCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: AppDimensions.getWidth(150),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // using stack
            Stack(
              children: [
                //image section
                Container(
                  height: AppDimensions.getHeight(100),
                  // width: AppDimensions.getWidth(220),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcmx.weightwatchers.com%2Fassets-proxy%2Fweight-watchers%2Fimage%2Fupload%2Fv1594406683%2Fvisitor-site%2Fprod%2Fca%2Fburgers_masthead_xtkxft&f=1&nofb=1&ipt=e1eb598b61447e5d6458f5ea85e4a23129c57ec4cd21bbf7810c1295f035c358&ipo=images"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppDimensions.getHeight(8)),
                        topRight: Radius.circular(AppDimensions.getHeight(8)),
                      )),
                ),
                //15 % off or free delivery
                Positioned(
                  top: AppDimensions.getHeight(15),
                  child: Container(
                    height: AppDimensions.getHeight(20),
                    width: AppDimensions.getWidth(50),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppDimensions.getHeight(10)),
                        bottomRight:
                            Radius.circular(AppDimensions.getHeight(10)),
                      ),
                    ),
                    child: Center(
                        child: Text("15% Off",
                            style: AppStyles.subtitleText
                                .copyWith(color: kWhiteColor, fontSize: 12))),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimensions.getHeight(10)),
            //for title , location and ratings
            const ReusableTextWidgetRes(
                text: "Hungry poppets", color: kBlackColor, fontSize: 16),
            const ReusableTextWidgetRes(
                text: "House: 00, Road:00, Chandigarh",
                color: kDarkGreyColor,
                fontSize: 12),
            SizedBox(height: AppDimensions.getHeight(5)),
            Padding(
              padding: EdgeInsets.only(left: AppDimensions.getWidth(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      FaIcon(FontAwesomeIcons.indianRupeeSign, size: 12),
                      Text("120"),
                    ],
                  ),
                  SizedBox(width: AppDimensions.getWidth(3)),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 12, color: kPrimaryColor),
                      Text(
                        "0.0",
                        style: AppStyles.subtitleText
                            .copyWith(color: kPrimaryColor, fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//============== reusable text widget for restaurants name  =================

class ReusableTextWidgetRes extends StatelessWidget {
  const ReusableTextWidgetRes({
    Key? key,
    required this.text,
    required this.color,
    required this.fontSize,
  }) : super(key: key);
  final String text;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppDimensions.getWidth(8)),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style:
            AppStyles.subtitleText.copyWith(color: color, fontSize: fontSize),
      ),
    );
  }
}

//================  reusable row widget  ===========================
class ReusableRowWidget extends StatelessWidget {
  const ReusableRowWidget({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.onTap,
  }) : super(key: key);
  final String firstText, secondText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(firstText, style: AppStyles.headlineText.copyWith(fontSize: 18)),
        InkWell(
          onTap: onTap,
          child: Text(secondText,
              style: AppStyles.subtitleText.copyWith(color: kPrimaryColor)),
        ),
      ],
    );
  }
}
