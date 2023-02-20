import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';
import 'package:project_one/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  //create animation controller
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Get.offNamed(
        RouteHelper.getPhoneVerificationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: AnimatedBuilder(
              animation: _animationController,
              child: SizedBox(
                height: AppDimensions.getHeight(300),
                width: double.maxFinite,
                child: const Center(
                  child: Image(image: AssetImage("assets/logo.png"),fit: BoxFit.cover),
                ),
              ),
              builder: (ctx, child) {
                return Transform.translate(
                  offset: Offset(1, 5),
                  child: child,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
