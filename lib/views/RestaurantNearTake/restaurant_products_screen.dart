import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/images.const.dart';
import 'package:project_one/views/RestaurantNearTake/add_product_restaurant.dart';
import 'package:project_one/views/home/components/restaurant_detail_screen.views.dart';
import 'package:project_one/widgets/global_var.widgets.dart';
import '../../constants/app_colors.constants.dart';
import '../../constants/dimensions.const.dart';
import '../../constants/styles.const.dart';
import '../home/home_screen.views.dart';

class RestaurantProductsScreen extends StatefulWidget {
  const RestaurantProductsScreen({super.key});

  @override
  State<RestaurantProductsScreen> createState() =>
      _RestaurantProductsScreenState();
}

class _RestaurantProductsScreenState extends State<RestaurantProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () => Get.to(() => const AddProductRestaurantScreen()),
          child: const Icon(Icons.add),
        ),
        body: CustomScrollView(
          slivers: [
            buildTopAppBarWithImage(),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(left: AppDimensions.getWidth(8)),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Row(
                  children: [
                    //image section
                    Container(
                      height: AppDimensions.getHeight(60),
                      width: AppDimensions.getWidth(90),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(restaurantFourImg),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    //text Section
                    Expanded(
                      child: Container(
                        height: AppDimensions.getHeight(110),
                        // width: AppDimensions.getWidth(230),
                        padding: const EdgeInsets.all(3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SizedBox(height: AppDimensions.getHeight(14)),
                            const ReusableTextWidgetRes(
                              text: "Hotel Punjab",
                              color: kBlackColor,
                              fontSize: 18,
                            ),
                            SizedBox(height: AppDimensions.getHeight(5)),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AppDimensions.getWidth(8)),
                              child: Text(
                                "House:00, Road:00, Street:00,City",
                                style: AppStyles.subtitleText
                                    .copyWith(fontSize: 14),
                              ),
                            ),
                            // SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //custom tab bar view
            SliverAppBar(
              elevation: 0,
              pinned: true,
              backgroundColor: kWhiteColor,
              title: TabBar(
                isScrollable: true,
                labelColor: kPrimaryColor,
                indicatorColor: kPrimaryColor,
                labelPadding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.getWidth(50)),
                unselectedLabelColor: kLightGreyColor,
                labelStyle:
                    AppStyles.subtitleText.copyWith(color: kPrimaryColor),
                tabs: const [
                  Tab(text: "All Foods"),
                  Tab(text: "Reviews"),
                ],
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: AppDimensions.getHeight(700),
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: Globalvariable.popularFoodsItems.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        var foodData = Globalvariable.popularFoodsItems[index];
                        return buildEditAndDeleteProductCard(foodData);
                      },
                    ),
                    Text("data"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildEditAndDeleteProductCard(Map<String, String> foodData) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.getHeight(8)),
      child: Row(
        children: [
          //image section
          Container(
            height: AppDimensions.getHeight(60),
            width: AppDimensions.getWidth(90),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(foodData["image"]!), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          SizedBox(width: AppDimensions.getWidth(10)),
          //column section'
          SizedBox(
            width: AppDimensions.getWidth(130),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodData["name"]!,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.subtitleText.copyWith(color: kBlackColor),
                ),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          color: kLightGreyColor,
                          size: 10,
                        ),
                      ),
                    ),
                    SizedBox(width: AppDimensions.getWidth(3)),
                    Text(
                      "(0)",
                      style: AppStyles.subtitleText.copyWith(
                        fontSize: AppDimensions.getHeight(14),
                      ),
                    ),
                  ],
                ),
                Text(
                  "₹ 150",
                  style: AppStyles.subtitleText.copyWith(
                    color: kPrimaryColor,
                    fontSize: AppDimensions.getHeight(15),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          //edit and delete section
          IconButton(
              onPressed: () => Get.snackbar(
                    "Edit",
                    "Functionality not availabel",
                    backgroundColor: Colors.blue,
                    colorText: kWhiteColor,
                  ),
              icon: const Icon(
                Icons.edit,
                color: Colors.blue,
              )),
          IconButton(
              onPressed: () => Get.snackbar(
                    "Delete",
                    "Functionality not availabel",
                    backgroundColor: Colors.red,
                    colorText: kWhiteColor,
                  ),
              icon: const Icon(Icons.delete, color: kRedColor)),
        ],
      ),
    );
  }

//top section
  SliverAppBar buildTopAppBarWithImage() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: AppDimensions.getWidth(8.0)),
          child: CustomCircleButtonWidget(onTap: () {}, icon: Icons.edit),
        ),
      ],
      backgroundColor: kPrimaryColor,
      elevation: 1,
      expandedHeight: AppDimensions.getHeight(260),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(restaurantFourImg,
            width: double.maxFinite, fit: BoxFit.cover),
      ),
    );
  }
}
