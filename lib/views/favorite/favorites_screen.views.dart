import 'package:flutter/material.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/styles.const.dart';
import 'package:project_one/widgets/custom_button_widget.widgets.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Favorite",
            style: AppStyles.subtitleText
                .copyWith(color: kBlackColor, fontSize: 20)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sorry !",
                style: AppStyles.subtitleText.copyWith(
                    color: kPrimaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: AppDimensions.getHeight(5)),
            Text("You are not logged in.", style: AppStyles.subtitleText),
            SizedBox(
              height: AppDimensions.getHeight(25),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    elevation: 1,
                    minimumSize: Size(AppDimensions.getWidth(220),
                        AppDimensions.getHeight(40))),
                onPressed: () {},
                child: Text("Login to continue",
                    style: AppStyles.subtitleText.copyWith(
                        color: kWhiteColor, fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }
}
