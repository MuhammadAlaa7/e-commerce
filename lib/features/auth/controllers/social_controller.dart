import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:store/core/utils/helper/network_manager.dart';
import 'package:store/core/utils/popups/full_screen_loader.dart';
import 'package:store/core/utils/popups/loaders.dart';
import 'package:store/core/utils/popups/toasts.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/features/personalization/controllers/user/user_controller.dart';

class SocialController extends GetxController {
  static SocialController get instance => Get.find();

  /// -------------------------- [Google Sign In ] --------------------------

  Future<void> googleSignIn() async {
    try {
      // start loading
      AppLoaders.loadingOverLayDialog();

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        AppToasts.errorSnackBar(
            title: 'Error', message: 'No internet connection');
        return;
      }

      // Google Authentication
      UserCredential? userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      if (userCredential == null) {
        return;
      }

      //  save user record
      await UserController.instance.saveUserRecord(userCredential);

      // redirect to home page

      AuthenticationRepository.instance.redirectScreen();
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());
    } finally {
      /// stop loading
      FullScreenLoader.closeLoadingDialog();
    }
  }

  /// -------------------------- [Facebook Sign In ] --------------------------
}
