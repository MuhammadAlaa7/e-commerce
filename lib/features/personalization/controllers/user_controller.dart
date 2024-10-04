import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store/core/common/widgets/buttons/default_button.dart';
import 'package:store/core/common/widgets/buttons/outlined_button.dart';
import 'package:store/core/utils/local_storage/storage_util.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/data/repos/user_repo.dart';
import 'package:store/features/personalization/models/user_model.dart';
import 'package:store/features/personalization/screens/profile/widgets/re_auth_user_login_form.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/network_manager.dart';
import 'package:store/core/utils/popups/full_screen_loader.dart';
import 'package:store/core/utils/popups/toasts.dart';

import '../../auth/screens/login_screen/login_screen.dart';

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
  RxBool isDarkMode = false.obs;
  @override
  void onInit()  {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch user record from Firebase
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      log('fetching user record');
      final user = await userRepository.fetchUserDataFromFirebase();
      this.user(user);
      log('user email record fetched ${user.email}');
    } catch (e) {
      user(UserModel.empty());
      log('error in fetching user record ${e.toString()}  ');
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user record from any registration provider like Google, Facebook, Apple
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // first refresh the user data to check if the user is already stored in the database
      await fetchUserRecord();

      // if the user is not already stored in the database, save it
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // Convert name to first and last name
          final nameParts =
              UserModel.nameSplitter(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          // Map data to user model
          UserModel user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            // The last name is the rest of the name
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );
          // Save user data
          await UserRepository.instance.saveUserDataToFirebase(user);
        }
      }
    } catch (e) {
      AppToasts.warningSnackBar(
        title: 'Data not saved',
        message: '''Something went wrong while saving your information. 
            You can re-save your data in your profile.''',
      );
    }
  }

  /// ------------------------------------------------------ Delete Account ------------------------------------------------------

//[ 1 ] - delete user account warning popup
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(AppSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: DefaultButton(
        width: 120,
        label: 'Delete',
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
      ),
      //confirmTextColor: Colors.white,
      cancel: CustomOutlinedButton(
          width: 120, label: 'Cancel', onPressed: () => Get.back()),
    );
  }

// [ 2 ] - Delete user account   -- this will be triggered from the warning popup confirm button
  void deleteUserAccount() async {
    try {
      // start loading
      FullScreenLoader.openLoadingDialog(
          'Processing...', AppImages.docerAnimation);

      // first re-authenticate user
      final authRepo = AuthenticationRepository.instance;

      /// return the id of the first provider used to sign in
      final provider = authRepo.currentAuthUser!.providerData
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
          await authRepo.signInWithGoogle();
          await authRepo.deleteAccount();
          GoogleSignIn().signOut();
          GoogleSignIn().disconnect();
          FullScreenLoader.closeLoadingDialog();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          FullScreenLoader.closeLoadingDialog();
          Get.to(() => const ReAuthUserLoginForm());
        }
      } else {
        FullScreenLoader.closeLoadingDialog();
        AppToasts.errorSnackBar(
            title: 'Oops!', message: 'Something went wrong');
      }
    } catch (e) {
      FullScreenLoader.closeLoadingDialog();
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }

// [ 3 ] - re-authenticate user with email and password
// the mail role of this function is to get the user email and password from the re-auth form
//and send it to the re-auth function in the auth repo
  void reAuthenticateUserWithEmailAndPassword() async {
    try {
      // start loading
      FullScreenLoader.openLoadingDialog(
          'Processing...', AppImages.docerAnimation);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.closeLoadingDialog();
        AppToasts.warningSnackBar(
            title: 'Oops!', message: 'No internet connection');
        return;
      }
      // validate from
      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.closeLoadingDialog();
        return;
      }

      // re-authenticate user
      await AuthenticationRepository.instance
          .reAuthenticateUserWithEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();
      FullScreenLoader.closeLoadingDialog();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      FullScreenLoader.closeLoadingDialog();
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }

// ----------- images -----------

// upload user profile image

  uploadUserProfileImage() async {
    try {
      // start loading
      profileLoading.value = true;
      // open image picker dialog to select image from the gallery
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );
      // if (image == null) {

      // }
      if (image != null) {
        // if there is an image selected
        // upload the image
        // get the image url from the firebase storage after you take the image selected from the gallery and upload it to the path 'users/images/profile/' in the firebase storage
        // it's up to you to choose the name of the path
        final imageUrl = await UserRepository.instance
            .uploadImage('users/images/profile/', image);

        //* until now we have uploaded the image to the firebase storage and got the url of the image
        //* we need to update the user profile picture in the server
        // convert this url to a json to be sent to the server
        Map<String, dynamic> json = {
          'profilePicture': imageUrl,
        };

        // update the profile picture in the current user data in the server
        await UserRepository.instance.updateSingleField(json);

        // update the profile picture in the current user model
        user.value.profilePicture = imageUrl;
        // show a success message to the user
        user.refresh();
        profileLoading.value = false;
        AppToasts.successSnackBar(
            title: 'Congratulations!',
            message: 'Your profile picture has been updated successfully');
      } else {
        // if there is no image selected , remove the loader  and by default it will show the previous image.
        profileLoading.value = false;
      }
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }

// log out the user

  Future<void> logOut() async {
    try {
      // start loader
      FullScreenLoader.openLoadingDialog(
          'Logging you out ...', AppImages.docerAnimation);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.closeLoadingDialog();
        AppToasts.errorSnackBar(
            title: 'Error', message: 'No internet connection');
        return;
      }
      // logout
      await AuthenticationRepository.instance.logOut();
      await AppLocalStorage.instance().closeBox();

      // stop loader
      FullScreenLoader.closeLoadingDialog();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }
}
