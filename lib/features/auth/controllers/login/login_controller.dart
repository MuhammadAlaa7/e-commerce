import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/helper/network_manager.dart';
import 'package:store/core/utils/popups/full_screen_loader.dart';
import 'package:store/core/utils/popups/toasts.dart';
import 'package:store/features/personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();


@override
  void onReady() {

    log('ready login controller');    
    super.onReady();
  }
  @override
  void onInit() {
    log('init login controller');
    email.text = box.get('remember_me_email') ?? '';

    password.text = box.get('remember_me_password') ?? '';

    rememberMe.value = box.get('remember_me') ?? false;
    super.onInit();
  }

  /// Variables
  /// ----------------
  //open hive box
  final box = Hive.box('auth');

  final email = TextEditingController();

  final password = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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

        return;
      }

      //  check remember me
      if (rememberMe.value == true) {
        // save email and password in the hive storage for later use email and password keys

        box.put('remember_me', true );
        box.put('remember_me_email', email.text.trim());
        box.put('remember_me_password', password.text.trim());
      } else {
        box.put('remember_me_email', '');
        box.put('remember_me_password', '');
        box.put('remember_me', false);
      }

      // Login the user
      await AuthenticationRepository.instance
          .signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      // stop loading

      await UserController.instance.fetchUserRecord();

      // redirect the screen because the user may not be verified yet
      AuthenticationRepository.instance.redirectScreen();
    } catch (e) {
      // stop loading
      AppToasts.errorSnackBar(title: 'Sign in Failed', message: e.toString());
      FullScreenLoader.closeLoadingDialog();
    }
    finally{
            FullScreenLoader.closeLoadingDialog();

    }
  }
}
