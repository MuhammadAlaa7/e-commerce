import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/data/repos/user_repo.dart';
import 'package:store/features/personalization/controllers/user_controller.dart';
import 'package:store/features/personalization/screens/profile/profile_screen.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/helper/network_manager.dart';
import 'package:store/core/utils/popups/full_screen_loader.dart';
import 'package:store/core/utils/popups/toasts.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final updateNameFormKey = GlobalKey<FormState>();

  // Init user data when the screen is opened
  @override
  void onInit() {
    super.onInit();
    initializeNames();
  }

  void initializeNames() {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateName() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
          'Updating your name ...', AppImages.docerAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected == false) {
        FullScreenLoader.closeLoadingDialog();
        AppToasts.errorSnackBar(
            title: 'No Internet', message: 'Please check your connection.');
        return;
      }

      // Form validation
      final bool isFormValid = updateNameFormKey.currentState!.validate();
      if (!isFormValid) {
        FullScreenLoader.closeLoadingDialog();
        return;
      }

      // Update user's first name and last name in Firebase Firestore
      Map<String, dynamic> name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim()
      };

      await userRepository.updateSingleField(name);

      // After updating the name in Firebase, update it also in the user model in user controller
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      userController.user.update((value) {});

/* 
why you need to update the user values manually here ?
by this line :  userController.user.update((value) {});
because : 
Primitive Types: For primitive types like int, double, String, etc., changes are automatically detected and UI updates are triggered.
Complex Objects: For complex objects (like UserModel), changes within the object’s properties need to be explicitly signaled if the object reference itself doesn’t change.
Complex objects require explicit signaling (using update()) to notify the reactive system of internal changes.
 */
      /// Remove loader
      FullScreenLoader.closeLoadingDialog();
      // Show success message
      AppToasts.successSnackBar(
          title: 'Congratulations',
          message: 'Your name has been updated successfully');
          // The first route in the navigation stack is kept, and the new route (ProfileScreen) is pushed on top of it.
Get.offNamedUntil(AppRoutes.profile, (Route<dynamic> route) => route.isFirst);


    
    } catch (e) {
      FullScreenLoader.closeLoadingDialog();
      AppToasts.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }
}
