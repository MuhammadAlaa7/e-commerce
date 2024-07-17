import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/buttons/outlined_button.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/data/repos/user_repo.dart';
import 'package:store/features/auth/models/user_model/user_model.dart';
import 'package:store/features/personalization/screens/profile/re_auth_user_login_form_screen.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/manager/network_manger.dart';
import 'package:store/utils/popups/full_screen_loader.dart';
import 'package:store/utils/popups/loaders.dart';

import '../../../auth/screens/login_screen/login_screen.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

// ***************
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch user record from Firebase
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDataFromFirebase();
      this.user.value = user;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user record from any registration provider like Google, Facebook, Apple
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // Convert name to first and last name
        final nameParts =
            UserModel.nameSplitter(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        // Map data to user model
        UserModel user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          // The last name is the rest of the name
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        // Save user data
        await UserRepository.instance.saveUserDataToFirebase(user);
      }
    } catch (e) {
      CLoaders.warningSnackBar(
        title: 'Data not saved',
        message: '''Something went wrong while saving your information. 
            You can re-save your data in your profile.''',
      );
    }
  }

// delete user account warning popup
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(CSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: DefaultButton(
        label: 'Delete',
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
      ),
      confirmTextColor: Colors.white,
      cancel:
          CustomOutlinedButton(label: 'Cancel', onPressed: () => Get.back()),
    );
  }

// Delete user account   -- this will be triggered from the warning popup confirm button
  void deleteUserAccount() async {
    try {
      // start loading
      CFullScreenLoader.openLoadingDialog(
          'Processing...', CImages.docerAnimation);

      // first re-authenticate user
      final auth = AuthenticationRepository.instance;

      final provider = auth.currentAuthUser!.providerData
          .map((provider) => provider.providerId)
          .first;
      /*
          Why selecting the first provider?
          This approach assumes that the first provider in the list is the primary one,
           which might be the provider the user used most recently 
           or the one used to initially create the account.
           */
      if (provider.isNotEmpty) {
        // re verify auth email
        if (provider == 'google.com') {
          log('>>>>>>>>>>>>>>>> the provider is google');
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          GoogleSignIn().signOut();
          GoogleSignIn().disconnect();
          CFullScreenLoader.closeLoadingDialog();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          CFullScreenLoader.closeLoadingDialog();
          Get.to(() => const ReAuthUserLoginForm());
        }
      }
    } catch (e) {
      CFullScreenLoader.closeLoadingDialog();
      CLoaders.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }

// re-authenticate user with email and password
  void reAuthenticateUserWithEmailAndPassword() async {
    try {
      // start loading
      CFullScreenLoader.openLoadingDialog(
          'Processing...', CImages.docerAnimation);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CFullScreenLoader.closeLoadingDialog();
        CLoaders.warningSnackBar(
            title: 'Opps!', message: 'No internet connection');
        return;
      }
      // validate from
      if (!reAuthFormKey.currentState!.validate()) {
        CFullScreenLoader.closeLoadingDialog();
        return;
      }

      // re-authenticate user
      await AuthenticationRepository.instance
          .reAuthenticateUserWithEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();
      CFullScreenLoader.closeLoadingDialog();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      CFullScreenLoader.closeLoadingDialog();
      CLoaders.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }
}
