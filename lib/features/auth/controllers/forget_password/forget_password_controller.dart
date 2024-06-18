import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/features/auth/screens/password_configuration_screen/password_reset_screen.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/manager/network_manger.dart';
import 'package:store/utils/popups/full_screen_loader.dart';
import 'package:store/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();


  /// -------- variables -----------------
  ///
  final email = TextEditingController();

  final forgetPasswordFormKey = GlobalKey<FormState>();

  /// --------------  methods -------------------

// send reset password email to the email box
  sendPasswordResetEmail() async {
    try {
// start loader

      CFullScreenLoader.openLoadingDialog(
          'Processing your request...', CImages.docerAnimation);

// check internet connection

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        CFullScreenLoader.closeLoadingDialog();
        CLoaders.errorSnackBar(
            title: 'Oops!', message: 'No Internet Connection !');
        return;
      }

// validate the form

      final isValid = forgetPasswordFormKey.currentState!.validate();

      if (!isValid) {
        CFullScreenLoader.closeLoadingDialog();
        CLoaders.errorSnackBar(title: 'Oops!', message: 'All Fields Required');
        return;
      }

      /// send the password reset email

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      /// close the loader
      CFullScreenLoader.closeLoadingDialog();

      // show success message that the password reset email link has been sent
      CLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to reset your password.');

      // navigate to the next screen
      Get.to(() =>  ResetPasswordScreen(email: email.text.trim(),));
    } catch (e) {
      CFullScreenLoader.closeLoadingDialog();
      CLoaders.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }

  /// re-send the reset password email to the email box
resendPasswordResetEmail(String email) async  {

    try {
// start loader

      CFullScreenLoader.openLoadingDialog(
          'Processing your request...', CImages.docerAnimation);

// check internet connection

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        CFullScreenLoader.closeLoadingDialog();
        CLoaders.errorSnackBar(
            title: 'Oops!', message: 'No Internet Connection !');
        return;
      }

      /// send the password reset email

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.trim());

      /// close the loader
      CFullScreenLoader.closeLoadingDialog();

      // show success message that the password reset email link has been sent
      CLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to reset your password.');

    
    } catch (e) {
      CFullScreenLoader.closeLoadingDialog();
      CLoaders.errorSnackBar(title: 'Oops!', message: e.toString());
    }



}

}
