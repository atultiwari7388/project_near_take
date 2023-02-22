import 'package:flutter/material.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';

class CustomTextAndIconWidget extends StatelessWidget {
  const CustomTextAndIconWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.backgroudColor = kPrimaryColor,
  });

  final IconData icon;
  final String text;
  final Color backgroudColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          //for image
          Container(
            height: AppDimensions.getHeight(50),
            width: AppDimensions.getWidth(50),
            decoration: BoxDecoration(
                color: backgroudColor, borderRadius: BorderRadius.circular(10)),
            child: Center(child: Icon(icon, color: kLightColor)),
          ),
          SizedBox(height: AppDimensions.getHeight(2)),
          //for text
          Text(text, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
