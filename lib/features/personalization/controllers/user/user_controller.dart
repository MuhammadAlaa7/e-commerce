import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:store/data/repos/user_repo.dart';
import 'package:store/features/auth/models/user_model/user_model.dart';
import 'package:store/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

// Fetch user record from firebase
  Future<void> fetchUserRecord() async {
    try { 
      profileLoading.value = true;
      // await Future.delayed(const Duration(seconds: 7));
      final user = await userRepository.fetchUserDataFromFirebase();
     // this.user(user);
        this.user.value = user ;
    } catch (e) {
      user(UserModel.empty());
     // CLoaders.warningSnackBar(title: 'no data retrieved', message: e.toString());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user record from any Registration provider  like [ Google , Facebook , Apple ]

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // convert name to first and last name
        final nameParts =
            UserModel.nameSplitter(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        // map data to user model
        UserModel user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          // the last name is the rest of the name
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        // save user data
        await UserRepository.instance.saveUserDataToFirebase(user);
      }
    } catch (e) {
      CLoaders.warningSnackBar(
        title: 'Data not saved',
        message: '''Something went wrong while saving you information. 
            You can re-save your data in your profile.''',
      );
    }
  }
}
