import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/success_screen/success_screen.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/text_strings.dart';
import 'package:store/core/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    timeToRedirect();
  }

  // void timeToRedirect() {
  //   //This stream is listening for any updates in the user's data
  //   //if the user's email has been verified and redirecting to the "SuccessScreen" if it is.

  //   FirebaseAuth.instance.authStateChanges().listen((user) async {
  //     log('user: ${user!.emailVerified}');
  //     if ( user.emailVerified) {
  //        await user.reload(); // Reload user to get the latest state
  //       navigateToSuccessScreen();
  //     }
  //   });
  // }

  // Navigate to success screen
  void navigateToSuccessScreen() {
    Get.offAll(() => SuccessScreen(
          image: AppImages.staticSuccessIllustration,
          title: AppTexts.yourAccountCreatedTitle,
          subTitle: AppTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.redirectScreen(),
        ));
  }

  // Send email verification link
  void sendEmailVerification() {
    try {
      AuthenticationRepository.instance.sendEmailVerification();
      AppToasts.successSnackBar(
          title: 'Email sent',
          message: 'Please check your inbox and verify your email');
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }

  // Time to automatically redirect on email verification
  void timeToRedirect() {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      final user = FirebaseAuth.instance.currentUser;
      log('user verified ? : ${user!.emailVerified}');
      await user?.reload(); // Reload user to get the latest state
      if (user != null && user.emailVerified) {
        timer.cancel();
        navigateToSuccessScreen();
      }
    });
  }

  // Manually check if email is verified or not by pressing the 'continue' button
  Future<void> checkEmailVerificationStatus() async {
    final user = FirebaseAuth.instance.currentUser;

    await user?.reload(); // Reload user data to get the latest state

    if (user != null && user.emailVerified) {
      navigateToSuccessScreen();
    } else {
      AppToasts.warningSnackBar(
          title: 'Warning!', message: 'Email not verified yet.');
    }
  }

  // Log out the user if back arrow is pressed from the verification email screen
  logOut() {
    AuthenticationRepository.instance.logOut();
    AppToasts.warningSnackBar(
        title: 'Warning!', message: 'You have been logged out');
  }
}
