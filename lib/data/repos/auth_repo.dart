import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:store/features/auth/controllers/onboarding/onboarding_cubit.dart';
import 'package:store/features/auth/screens/email_verification_screen/verify_email_screen.dart';
import 'package:store/nvaigation_menu.dart';
import 'package:store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:store/utils/exceptions/firebase_exceptions.dart';
import 'package:store/utils/exceptions/format_exceptions.dart';
import 'package:store/utils/exceptions/platform_exceptions.dart';

import '../../features/auth/screens/login_screen/login_screen.dart';
import '../../features/auth/screens/onboarding_screen/onboarding_screen.dart';

// The logic of the authentication process
class AuthenticationRepository extends GetxController {
  // * find the instance of the AuthenticationRepository that provided in the getx system to use it
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  final box = Hive.box('storage');

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    redirectScreen();
  }

  void redirectScreen() {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        log('********************** user is verified ******************');
        Get.offAll(() => const NavigationMenu());
      } else {
        print(
            '********************** user is not verified but is not null ******************');
        // if the user is not verified
        Get.offAll(
          () => VerifyEmailScreen(
            email: user.email,
          ),
        );
      }
    } else {
      log('********************** user is null ******************');
      // if the user is null <<< new >>>

      // check if the the box DOESN'T contain the key < isFirstTime >
      if (!box.containsKey('isFirstTime')) {
        box.put('isFirstTime', true);
      }
      box.get('isFirstTime')
          ? Get.offAll(
              () => BlocProvider(
                create: (context) => OnBoardingCubit(),
                child: const OnBoardingScreen(),
              ),
            )
          : Get.offAll(() => const LoginScreen());
    }
  }

  // **********************  Email & password Authentication Process  **********************
  /// [EmailAndPasswordAuthentication] - Sign In with email and password
  Future<UserCredential> logInWithEmailAndPassword(
      String email, String password) async {
    try {
      log('Attempting to log in...');
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      log('Logged in successfully');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException caught: ${e.code}');
      log('Error message: ${CustomFireBaseAuthException(e.code).message}');
      throw CustomFireBaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      log('FirebaseException caught: ${e.code}');
      log('Error message: ${CustomFirebaseException(e.code).message}');
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (e) {
      log('FormatException caught: ${e.message}');
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      log('PlatformException caught: ${e.code}');
      log('Error message: ${CustomPlatformException(e.code).message}');
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      log('Unknown exception caught: $e');
      throw 'Something went wrong, please try again later!';
    }
  }


  /// [EmailAndPasswordAuthentication] - Register with email and password

//* this function is used to register a user with email and password and give you a user credential
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
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



  /// [EmailVerification] - Mail Verification

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
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

// ******************* log out user ****************** \\

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
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





// >>>>> here we don't use the custom exception classes we built , we use the
// default exception classes by flutter and it is okay  <<<

// //* this function is used to register a user with email and password and give you a user credential
//   Future<UserCredential> registerWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       return await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       //! throw the only the message of that exception caught
//       throw FirebaseAuthException(code: e.code, message: e.message).message.toString();
//     } on FirebaseException catch (e) {
//       throw FirebaseException(
//           plugin: 'firebase_auth', code: e.code, message: e.message).message.toString();
//     } on FormatException catch (e) {
//       throw FormatException(e.message).message.toString();
//     } on PlatformException catch (e) {
//       throw PlatformException(code: e.code, message: e.message);
//     } catch (e) {
//       throw 'Something went wrong , please try again later!';
//     }
//   }
