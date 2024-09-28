import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/utils/constants/colors.dart';

class AppLoaders {
  static void loadingOverLayDialog({String title = '', String message = ''}) {
    Get.defaultDialog(
      title: title,
      middleText: message,
      content: const CircularProgressIndicator(
        color: AppColors.primary,
      ),
      onWillPop: () async => false,
      barrierDismissible: false,
      backgroundColor: Colors.transparent,
    );
  }
}
