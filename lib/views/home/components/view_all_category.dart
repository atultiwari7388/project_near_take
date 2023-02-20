import 'package:flutter/material.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/styles.const.dart';

import '../../../constants/dimensions.const.dart';
import '../home_screen.views.dart';
import '../../../widgets/global_var.widgets.dart';

//============== view all category section ==================
class ViewAllCategorySection extends StatelessWidget {
  const ViewAllCategorySection({Key? key}) : super(key: key);

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
          "Categories",
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
            return Padding(
              padding: EdgeInsets.only(right: AppDimensions.getWidth(6)),
              child: CategoryCard(
                icon: categoryData["image"]!,
                title: categoryData["title"]!,
                onTap: () {},
              ),
            );
          }),
    );
  }
}
