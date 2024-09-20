import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

/// a toast in app development is a notification that is displayed at the bottom of the screen.
class AppToasts extends GetxController {
  static AppToasts get instance => Get.find();

// custom toast message
  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      elevation: 0,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppHelperFunctions.isDarkMode(Get.context!)
              ? AppColors.darkGrey.withOpacity(0.9)
              : Colors.grey.withOpacity(0.9),
        ),
        child: Text(
          message,
          style: Theme.of(Get.context!).textTheme.labelLarge,
        ),
      ),
    ));
  }

//* success snack bar
  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: AppColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check_circle, color: Colors.white),
    );
  }

// * warning snack bar
  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.warning, color: Colors.white),
    );
  }

// * error snack bar
  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.error, color: Colors.white),
    );
  }
}
