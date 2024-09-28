import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/helper/network_manager.dart';
import 'package:store/core/utils/popups/full_screen_loader.dart';
import 'package:store/core/utils/popups/toasts.dart';

class LogInController extends GetxController {
  static LogInController instance = Get.find();

  @override
  void onInit() {
/* 
first : get the email and password from the hive box if it is not null [not the first time ] and if it is true
second : set the value of the remember_me to the value from the hive box to true if it is true in hive and false if it has nothing [null]
 */
// null here means that the user is in the first time opening the app so the hive box is empty
    email.text =
        box.get('remember_me') == true && box.get('remember_me') != null
            ? box.get('remember_me_email')
            : '';
    password.text =
        box.get('remember_me') == true && box.get('remember_me') != null
            ? box.get('remember_me_password')
            : '';
    rememberMe.value = box.get('remember_me') ?? false;
    super.onInit();
  }

  /// Variables
  /// ----------------
  //open hive box
  final box = Hive.box('storage');

  final email = TextEditingController();

  final password = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();

  final RxBool hidePassword = true.obs;
  RxBool rememberMe = false.obs;

  // Login the user

  Future<void> login() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
          'We are logging you in ...', AppImages.docerAnimation);

      // Check internet connection     >> [ if there is no internet don't continue the login process ]

      final isConnected = await NetworkManager.instance.isConnected();

      log('Network connected: $isConnected'); // Debugging line

      if (!isConnected) {
        FullScreenLoader.closeLoadingDialog();
        AppToasts.errorSnackBar(
            title: 'Error', message: 'No internet connection');
        return;
      }

      // Form validation
/* 
     the method validate()
1.  operate the validation of the fields of the form.
2.returns true if the form is valid and false if it is not.

 */
      bool isFormValid = loginFormKey.currentState!.validate();
      if (isFormValid == false) {
        FullScreenLoader.closeLoadingDialog();
        AppToasts.errorSnackBar(title: 'Error', message: 'All fields required');
        return;
      }

      //  check remember me
      if (rememberMe.value == true) {
        // save email and password in the hive storage for later use
        box.put('remember_me_email', email.text.trim());
        box.put('remember_me_password', password.text.trim());
        box.put('remember_me', rememberMe.value);
      } else {
        // save email and password in the hive storage for later use
        box.put('remember_me_email', '');
        box.put('remember_me_password', '');
        box.put('remember_me', false);
      }

      // Login the user
      await AuthenticationRepository.instance
          .logInWithEmailAndPassword(email.text.trim(), password.text.trim());

      // stop loading
      FullScreenLoader.closeLoadingDialog();

      // redirect to home page   if logged in successfully

      AuthenticationRepository.instance.redirectScreen();
    } catch (e) {
      // stop loading
      AppToasts.errorSnackBar(title: 'Error', message: e.toString());
      FullScreenLoader.closeLoadingDialog();
      log('Error caught: $e'); // Debugging line

      // show error
    }
  }
}
