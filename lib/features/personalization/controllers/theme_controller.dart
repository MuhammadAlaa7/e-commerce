import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Load the theme mode from Hive when the controller is initialized
    loadTheme();
  }

  void loadTheme() async {
    isDarkMode.value = Hive.box('theme').get('isDarkMode', defaultValue: false);
  }

  void toggleTheme() async {
    isDarkMode.toggle();

    Hive.box('theme').put('isDarkMode', isDarkMode.value);

    // Change the theme dynamically in the app
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light , );
  }
}
