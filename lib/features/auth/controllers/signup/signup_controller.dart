import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/data/repos/user_repo.dart';
import 'package:store/features/personalization/models/user_model.dart';
import 'package:store/features/auth/screens/email_verification_screen/verify_email_screen.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/manager/network_manger.dart';
import 'package:store/utils/popups/full_screen_loader.dart';
import 'package:store/utils/popups/loaders.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

// variables

/* 
obs is used to make a variable observable. 
When a variable is marked as observable, any changes to its value will automatically
 notify the widgets that are listening to it,
  causing them to rebuild with the new value.
 */

// Observable variable  :: >>  a variable that will be change so it will be observed by the observer >>> OBX widget
  Rx hidePassword = true.obs;
  Rx privacyPolicy = false.obs;

  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///* signUp function

  Future<void> signUp() async {
    try {
      // Start loading
      CFullScreenLoader.openLoadingDialog(
          'We are processing your information...', CImages.loaderAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      log('Network connected: $isConnected'); // Debugging line
      if (!isConnected) {
        CLoaders.errorSnackBar(
            title: 'Error', message: 'No internet connection');
        CFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Form validation
      bool isFormValid = signupFormKey.currentState!.validate();
      if (!isFormValid) {
        CLoaders.errorSnackBar(title: 'Error', message: 'All fields required ');
        CFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Privacy policy check
      // Add your privacy policy check here and log if necessary

      if (privacyPolicy.value == false) {
        CLoaders.errorSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create an account, you must accept our Privacy Policy and terms of use.');
        CFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Register user in Firebase authentication & save user data in Firebase
      // Add your registration code here and log progress

      // trim() removes any leading or trailing spaces
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

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

      CLoaders.successSnackBar(
          title: 'Congratulations!',
          message: 'Your account has been created! Verify email to continue.');

      CFullScreenLoader.closeLoadingDialog();
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      log('Error caught: $e'); // Debugging line
      CLoaders.errorSnackBar(title: 'Error', message: e.toString());
      CFullScreenLoader.closeLoadingDialog();
    }
  }
}
