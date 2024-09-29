import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/success_screen/success_screen.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/text_strings.dart';
import 'package:store/core/utils/popups/toasts.dart';
import 'package:store/features/auth/screens/login_screen/login_screen.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  Timer? _timerInstance; // Store the timer instance to be used in two methods [timeToRedirect] and [logOut]

  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    timeToRedirect();
  }

  // Send email verification link
  void sendEmailVerification() {
    try {
      AuthenticationRepository.instance.sendEmailVerification();
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }

  /// Time to automatically redirect user to success screen on email verification
  void timeToRedirect() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _timerInstance = Timer.periodic(const Duration(seconds: 4), (timer) async {
        log('user verified ? : ${user.emailVerified}');
        await user.reload(); // Reload user to get the latest state
        if (user.emailVerified) {
          timer.cancel();
          _timerInstance = null; // Clear the timer reference
          navigateToSuccessScreen();
        }
      });
    }
  }

  // Navigate to success screen
  void navigateToSuccessScreen() {
    Get.offAll(() => SuccessScreen(
          image: AppImages.staticSuccessIllustration,
          title: AppTexts.yourAccountCreatedTitle,
          subTitle: AppTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.redirectScreen(),
        ));
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
  void logOut() {
    _timerInstance?.cancel(); // Stop the timer if it's running
    _timerInstance = null; // Clear the timer reference
    AuthenticationRepository.instance.logOut();
    AppToasts.warningSnackBar(
        title: 'Warning!', message: 'You have been logged out');
    Get.offAll(() => const LoginScreen());
  }
}
