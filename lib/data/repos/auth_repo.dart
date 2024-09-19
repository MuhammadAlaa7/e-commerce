import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:store/data/repos/user_repo.dart';
import 'package:store/features/auth/controllers/onboarding/onboarding_cubit.dart';
import 'package:store/features/auth/screens/email_verification_screen/verify_email_screen.dart';
import 'package:store/navigation_menu.dart';
import 'package:store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:store/utils/exceptions/firebase_exceptions.dart';
import 'package:store/utils/exceptions/format_exceptions.dart';
import 'package:store/utils/exceptions/platform_exceptions.dart';

import '../../features/auth/screens/login_screen/login_screen.dart';
import '../../features/auth/screens/onboarding_screen/onboarding_screen.dart';
import '../../utils/local_storage/storage_util.dart';

// The logic of the authentication process
class AuthenticationRepository extends GetxController {
  // * find the instance of the AuthenticationRepository that provided in the getx system to use it
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  // Get authenticated user
  User? get currentAuthUser => _auth.currentUser;

  final box = Hive.box('storage');

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    redirectScreen();
  }

  void redirectScreen() async {
    final user = currentAuthUser;
    if (user != null) {
      if (user.emailVerified) {
        // initialize local storage for the user , and open a box for him
        await CustomLocalStorage.init(user.uid);
        Get.offAll(() => const HomeMenu());
      } else {
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
      throw CustomFireBaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
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

  /// [EmailVerification] - forget password & reset password

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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
      FirebaseAuth.instance.signOut();

      GoogleSignIn().signOut();
      GoogleSignIn().disconnect();
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

  /// *************************** Social Authentication  *************************** \\

// [Google Authentication] - Sign In with Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      // trigger the google authentication flow >>> This opens a dialog for the user to sign in with their Google account.
      final GoogleSignInAccount? googleUserAccount =
          await GoogleSignIn().signIn();
      // Obtain the auth details from the request   [ google account ]
      final GoogleSignInAuthentication? googleAuth =
          await googleUserAccount?.authentication;
      // Create a new credential

      // keep user

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credential);
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

  // [re-authenticate ]  -- re-authenticate user

  Future<void> reAuthenticateUserWithEmailAndPassword(
      String email, String password) async {
    try {
      // create a new credential
      AuthCredential userCredential =
          EmailAuthProvider.credential(email: email, password: password);

      // re-authenticate the user
      await _auth.currentUser?.reauthenticateWithCredential(userCredential);
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

// [delete account]  -- remove user auth and firebase account
  Future<void> deleteAccount() async {
    try {
      UserRepository.instance.removeUserData(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
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

//? >>>>> here we don't use the custom exception classes we built , we use the
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
