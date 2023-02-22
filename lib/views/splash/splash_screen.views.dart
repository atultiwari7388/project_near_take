import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/views/phoneVerification/phone_verification.views.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  //create animation controller
  // late final AnimationController _animationController =
  //     AnimationController(duration: const Duration(seconds: 2), vsync: this)
  //       ..repeat(max: 1, period: const Duration(seconds: 2));

  // @override
  // void dispose() {
  //   super.dispose();
  //   _animationController.dispose();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //     const Duration(seconds: 4),
  //     () => Get.offNamed(
  //       RouteHelper.getPhoneVerificationScreen(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset("assets/logo.png", fit: BoxFit.cover),
      nextScreen: const PhoneVerificationScreen(),
      backgroundColor: kWhiteColor,
      splashTransition: SplashTransition.fadeTransition,
      duration: 3000,
      splashIconSize: AppDimensions.getHeight(375),
    );
  }
}
