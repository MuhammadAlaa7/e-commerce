import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/repos/user_repo.dart';
import 'package:store/features/personalization/controllers/user/user_controller.dart';
import 'package:store/features/personalization/screens/profile/profile_screen.dart';
import 'package:store/utils/constants22/image_strings.dart';
import 'package:store/utils/helper/network_manager.dart';
import 'package:store/utils/popups/full_screen_loader.dart';
import 'package:store/utils/popups/loaders.dart';

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
      CFullScreenLoader.openLoadingDialog(
          'Updating your name ...', CImages.docerAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected == false) {
        CFullScreenLoader.closeLoadingDialog();
        CLoaders.errorSnackBar(
            title: 'No Internet', message: 'Please check your connection.');
        return;
      }

      // Form validation
      final bool isFormValid = updateNameFormKey.currentState!.validate();
      if (!isFormValid) {
        CFullScreenLoader.closeLoadingDialog();
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
      CFullScreenLoader.closeLoadingDialog();
      // Show success message
      CLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your name has been updated successfully');

      Get.offUntil(
        MaterialPageRoute(builder: (_) => const ProfileScreen()),
        (route) => route.isFirst,
      );
      // Go back to user profile screen
      // Get.offAll(() => const HomeScreen());
      // Get.to(() => const SettingsScreen());
      // Get.to(() => const ProfileScreen());
      //  Navigator.of(Get.context!).pop();
    } catch (e) {
      CFullScreenLoader.closeLoadingDialog();
      CLoaders.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }
}
