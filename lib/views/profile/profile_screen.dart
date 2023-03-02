import 'package:flutter/material.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/images.const.dart';
import 'package:project_one/constants/styles.const.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            buildTopSection(),
            buildContentSection(),
          ],
        ),
      ),
    );
  }

  Widget buildContentSection() {
    return Column(
      children: [
        Text("Atul Tiwari", style: AppStyles.headlineText),
        Text("tiwariatul9526@gmail.com", style: AppStyles.subtitleText),
        Text("+918960290289", style: AppStyles.subtitleText),
      ],
    );
  }

  Widget buildTopSection() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: AppDimensions.getWidth(100)),
            child: buildCoverImage()),
        Positioned(
            top: AppDimensions.getHeight(208), child: buildProfileImage()),
      ],
    );
  }

  Widget buildCoverImage() {
    return Container(
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        image: DecorationImage(image: AssetImage(pizzaImg), fit: BoxFit.cover),
      ),
      //add network image or asset image
      height: AppDimensions.getHeight(280),
      width: double.infinity,
    );
  }

  Widget buildProfileImage() {
    return CircleAvatar(
      radius: AppDimensions.getWidth(144) / 2,
      backgroundColor: kLightGreyColor,
      backgroundImage: const AssetImage("assets/logo.png"),
    );
  }
}
