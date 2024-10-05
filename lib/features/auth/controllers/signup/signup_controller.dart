
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/data/repos/user_repo.dart';
import 'package:store/features/personalization/models/user_model.dart';
import 'package:store/features/auth/screens/email_verification_screen/verify_email_screen.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/helper/network_manager.dart';
import 'package:store/core/utils/popups/full_screen_loader.dart';
import 'package:store/core/utils/popups/toasts.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

// variables

/* 
obs is used to make a variable observable. 
When a variable is marked as observable, any changes to its value will automatically
 notify the widgets that are listening to it, >> Obx widgets
  causing them to rebuild the new value.
 */

// Observable variable  :: >>  a variable that will be change so it will be observed by the observer >>> OBX widget
  Rx isSecureText = true.obs;
  Rx privacyPolicy = false.obs;

  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  ///* signUp function

  Future<void> signUp() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        AppImages.loaderAnimation,
      );

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        AppToasts.errorSnackBar(
            title: 'Error', message: 'No internet connection');
        FullScreenLoader.closeLoadingDialog();
        return;
      }

      // Form validation
      bool isFormValid = signUpFormKey.currentState!.validate();
      if (!isFormValid) {
    
        FullScreenLoader.closeLoadingDialog();
        return;
      }

      // Privacy policy check
      // Add your privacy policy check here and log if necessary

      if (privacyPolicy.value == false) {
        AppToasts.errorSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create an account, you must accept our Privacy Policy and terms of use.');
        FullScreenLoader.closeLoadingDialog();
        return;
      }

      // Register user in Firebase authentication & save user data in Firebase
      // Add your registration code here and log progress

      // trim() removes any leading or trailing spaces
      final userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Save authenticated user data [ which returned from registration ] in Firebase store database

      final newUser = UserModel(
        id: userCredential.user!.uid, // unique id for each user
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      await UserRepository.instance.saveUserDataToFirebase(newUser);

      // Show a success message

      AppToasts.successSnackBar(
          title: 'Congratulations!',
          message: 'Your account has been created! Verify email to continue.');

      FullScreenLoader.closeLoadingDialog();
      Get.offAllNamed(AppRoutes.verifyEmail , arguments:  email.text.trim() );
    } catch (e) {
      AppToasts.errorSnackBar(
          title: 'Registration Failed',
          message:
              'Something went wrong while signing up. Please try again later.');
      FullScreenLoader.closeLoadingDialog();
    }
  }
}
