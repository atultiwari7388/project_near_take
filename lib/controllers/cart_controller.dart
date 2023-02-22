import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';

class CartController extends GetxController {
  int x = 1;

  increment() {
    if (x < 1) {
      x++;
    }
    update();
    Get.snackbar(
      "Maximum",
      "You can add only 1 item",
      backgroundColor: kPrimaryColor,
      colorText: kWhiteColor,
      snackPosition: SnackPosition.TOP,
    );
  }

  decrement() {
    if (x > 1) {
      x--;
    }
    update();
    Get.snackbar(
      "Min",
      "You can't increment 0 Quantity",
      backgroundColor: kPrimaryColor,
      colorText: kWhiteColor,
      snackPosition: SnackPosition.TOP,
    );
  }
}
