import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/features/auth/models/user_model/user_model.dart';
import 'package:store/features/personalization/controllers/user/user_controller.dart';
import 'package:store/utils/exceptions/firebase_exceptions.dart';
import 'package:store/utils/exceptions/format_exceptions.dart';
import 'package:store/utils/exceptions/platform_exceptions.dart';

import '../../utils/exceptions/firebase_auth_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // instance from firebase store database
  final _db = FirebaseFirestore.instance;
  final currentUserId = AuthenticationRepository.instance.currentAuthUser?.uid;

  /// -------- Methods ---------------

  //*************************** save user data to firebase ***********************
  Future<void> saveUserDataToFirebase(UserModel user) async {
    try {
// open a new collection called users and
//then a document with the user id
// and set the user data in the form of json <  map  > because we are using firebase and needs json
      await _db.collection('users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw CustomFireBaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , please try again later!';
    }
  }

  //*************************** fetch user data from firebase ***********************
  Future<UserModel> fetchUserDataFromFirebase() async {
    try {
      final documentSnapshot =
          await _db.collection('users').doc(currentUserId).get();

      if (documentSnapshot.exists) {
        return UserModel.fromJson(documentSnapshot);
      } else {
        // if there is no document return an empty model
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw CustomFireBaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , please try again later!';
    }
  }

  //*************************** update user data in firebase ***********************
  Future<void> updateUserData(UserModel updatedUser) async {
    try {
      await _db
          .collection('users')
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } on FirebaseAuthException catch (e) {
      throw CustomFireBaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , please try again later!';
    }
  }

  ///---------------------------------   ?????? --------------------------------

  ///* update any field in specific users collection like name , email , phone number etc
  /// * not updating all fields
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      //  final userId = Get.find<UserController>().user.value.id;
      await _db.collection('users').doc(currentUserId).update(json);
    } on FirebaseAuthException catch (e) {
      throw CustomFireBaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , please try again later!';
    }
  }

  //*************************** Delete user from firebase ***********************
  Future<void> removeUserData(String userId) async {
    try {
      await _db.collection('users').doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw CustomFireBaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , please try again later!';
    }
  }

// -------------------  images -------------------

// [1] - upload any image to firebase
//* this function takes the image and uploads it to firebase and returns the url of the image too
  Future<String> uploadImage(String path, XFile image) async {

    try {
          // opening a ref with a unique name to point to the image
          final imageRef = FirebaseStorage.instance.ref(path).child(image.name);
          // upload image 
          await imageRef.putFile(File(image.path)) ;
          // get the url of the image to send it to the user data to update the profile picture field
          final imageUrl = await imageRef.getDownloadURL();
          
          return imageUrl;

       } on FirebaseAuthException catch (e) {
      throw CustomFireBaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , please try again later!';
    }

  }
}
