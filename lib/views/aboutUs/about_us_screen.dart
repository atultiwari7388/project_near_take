import 'package:flutter/material.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/constants/styles.const.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 1,
          centerTitle: true,
          backgroundColor: kWhiteColor,
          title: Text(
            "About us",
            style: AppStyles.subtitleText.copyWith(
              color: kBlackColor,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(AppDimensions.getHeight(8)),
            padding: EdgeInsets.all(AppDimensions.getHeight(5)),
            child: Text(
              "Our company Mylex InfoTech private limited is specialized in various fields ranging from IT to legal services. The main motive behind a incorporation of a company is to provide unhindered support and solutions in the initials phase of business to the Entrepreneurs/Startups and Business owners which includes company registration, branding ,web development, licensing ,digital marketing and various certification from various bodies.  Our’s is a team wherein experts from various fields like Company secretaries, IT professional, Chartered Accountants, Cost Accountants, lawyers and such like work together under one roof to help Entrepreneurs take their first step to success in business making a reckon-able spot in the competitive market.",
              textAlign: TextAlign.center,
              style: AppStyles.subtitleText.copyWith(
                color: kBlackColor,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
