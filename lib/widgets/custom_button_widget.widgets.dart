import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_one/constants/dimensions.const.dart';
import '../constants/styles.const.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.white,
    required this.textColor,
    required this.iconColor,
    required this.onTap,
  }) : super(key: key);

  final Color backgroundColor, borderColor, textColor, iconColor;
  final String text;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.all(AppDimensions.getHeight(8)),
        // margin: const EdgeInsets.all(8),
        height: AppDimensions.getHeight(45),
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(AppDimensions.getWidth(5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, color: iconColor),
             SizedBox(width: AppDimensions.getHeight(10)),
            Text(
              text,
              style: AppStyles.subtitleText
                  .copyWith(fontWeight: FontWeight.bold, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
