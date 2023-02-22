import 'package:flutter/material.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/images.const.dart';
import 'package:project_one/constants/styles.const.dart';
import 'package:project_one/views/home/components/category_details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Favorite",
              style: AppStyles.subtitleText
                  .copyWith(color: kBlackColor, fontSize: 20)),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: kPrimaryColor,
            labelPadding:
                EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(50)),
            labelColor: kPrimaryColor,
            unselectedLabelColor: kBlackColor,
            labelStyle: AppStyles.subtitleText.copyWith(color: kPrimaryColor),
            tabs: const [
              Tab(text: "Restaurant "),
              Tab(text: "Food"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RestaurantData(
                    title: "Hungrey Puppets",
                    image: restaurantOneImg,
                    onTap: () {},
                    iconColor: kPrimaryColor,
                  ),
                );
              },
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FoodData(
                    title: "Gulab jamun",
                    image: gulabJamunImg,
                    onTap: () {},
                    iconColor: kPrimaryColor,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
