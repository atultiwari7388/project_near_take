import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/styles.const.dart';
import 'package:project_one/views/home/components/cuisines_details_screen.dart';
import '../../../constants/dimensions.const.dart';
import '../home_screen.views.dart';
import '../../../widgets/global_var.widgets.dart';

//============== view all category section ==================
class ViewAllCuisinesSection extends StatelessWidget {
  const ViewAllCuisinesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: kBlackColor),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, color: kBlackColor)),
        title: Text(
          "Cuisines",
          style: AppStyles.subtitleText.copyWith(color: kBlackColor),
        ),
        centerTitle: true,
        backgroundColor: kWhiteColor,
        elevation: 0,
      ),
      body: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Globalvariable.categoryItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 1,
            childAspectRatio: 3.5 / 5,
          ),
          itemBuilder: (ctx, index) {
            final categoryData = Globalvariable.categoryItems[index];
            final icon = categoryData["image"]!;
            final title = categoryData["title"]!;
            return Padding(
              padding: EdgeInsets.only(right: AppDimensions.getWidth(6)),
              child: CategoryCard(
                icon: icon,
                title: title,
                onTap: () => Get.to(() => CuisinesFoodDetailsScreen(
                    appBarTitle: title, resImage: icon)),
              ),
            );
          }),
    );
  }
}
