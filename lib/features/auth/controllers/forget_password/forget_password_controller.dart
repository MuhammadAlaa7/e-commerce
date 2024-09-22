import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/features/auth/screens/password_configuration_screen/password_reset_screen.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/helper/network_manager.dart';
import 'package:store/core/utils/popups/full_screen_loader.dart';
import 'package:store/core/utils/popups/toasts.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

@override
  void onInit() {
    email.text = ''; 
    super.onInit();
  }

  /// -------- variables -----------------
  ///
  final email = TextEditingController();

  final forgetPasswordFormKey = GlobalKey<FormState>();

  /// --------------  methods -------------------

// send reset password email to the email box
  sendPasswordResetEmail() async {
    try {
// start loader

      FullScreenLoader.openLoadingDialog(
          'Processing your request...', AppImages.docerAnimation);

// check internet connection

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.closeLoadingDialog();
        AppToasts.errorSnackBar(
            title: 'Oops!', message: 'No Internet Connection !');
        return;
      }

// validate the form

      final isValid = forgetPasswordFormKey.currentState!.validate();

      if (!isValid) {
        FullScreenLoader.closeLoadingDialog();
        AppToasts.errorSnackBar(title: 'Oops!', message: 'All Fields Required');
        return;
      }

      /// send the password reset email

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      /// close the loader
      FullScreenLoader.closeLoadingDialog();

      // show success message that the password reset email link has been sent
      AppToasts.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to reset your password.');

      // navigate to the next screen
      Get.to(() => ResetPasswordScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      FullScreenLoader.closeLoadingDialog();
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }

  /// re-send the reset password email to the email box
  resendPasswordResetEmail(String email) async {
    try {
// start loader

      FullScreenLoader.openLoadingDialog(
          'Processing your request...', AppImages.docerAnimation);

// check internet connection

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.closeLoadingDialog();
        AppToasts.errorSnackBar(
            title: 'Oops!', message: 'No Internet Connection !');
        return;
      }

      /// send the password reset email

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.trim());

      /// close the loader
      FullScreenLoader.closeLoadingDialog();

      // show success message that the password reset email link has been sent
      AppToasts.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to reset your password.');
    } catch (e) {
      FullScreenLoader.closeLoadingDialog();
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }
}
