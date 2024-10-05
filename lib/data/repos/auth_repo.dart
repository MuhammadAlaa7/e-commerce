import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:store/core/routes/app_pages.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/data/repos/user_repo.dart';
import 'package:store/features/auth/screens/email_verification_screen/verify_email_screen.dart';
import 'package:store/navigation_menu.dart';
import 'package:store/core/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:store/core/utils/exceptions/firebase_exceptions.dart';
import 'package:store/core/utils/exceptions/format_exceptions.dart';
import 'package:store/core/utils/exceptions/platform_exceptions.dart';

import '../../features/auth/screens/login_screen/login_screen.dart';
import '../../features/on_boarding/screens/onboarding_screen/onboarding_screen.dart';
import '../../core/utils/local_storage/storage_util.dart';

// The logic of the authentication process
class AuthenticationRepository extends GetxController {
  // * find the instance of the AuthenticationRepository that provided in the getx system to use it
  static AuthenticationRepository get instance => Get.find();
  // this is the gate that you need to perform firebase authentication operations
  final _auth = FirebaseAuth.instance;

  // Get authenticated user >> the user that is currently logged in
  User? get currentAuthUser => _auth.currentUser;

//* Returns a previously opened box.
  final box = Hive.box('auth');

  @override
  void onReady() {
     FlutterNativeSplash.remove();
    redirectScreen();
  }

  void redirectScreen() async {
    final user = currentAuthUser;
    // if the user is not null means the user is already logged in
    if (user != null) {
      if (user.emailVerified) {
        // init the local storage for the user only for the first time

        await AppLocalStorage.init(user.uid);
        // initialize local storage for the user , and open a box for him
        AppLocalStorage.instance().readData('favorites');
        AppLocalStorage.instance().readData('cartItems');

        Get.offAll(() => const HomeMenu());
      } else {
        // if the user is not verified
     Get.offAllNamed(AppRoutes.verifyEmail,arguments: user.email );
      }
    } else {
      if (box.containsKey('on_boarding_done')) {
        Get.offAllNamed(AppRoutes.login); 
      } else {
        // when tapping the next button on the onboarding screen
        // the on_boarding_done key is set to true in the auth box
        Get.offAllNamed(AppRoutes.onBoarding); 
      }
    }
  }


  
  /// *************************** Social Authentication  *************************** \\

// [Google Authentication] - Sign In with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // trigger the google authentication flow  >>>
      //This opens a dialog for the user to sign in with their Google accounts.
      final GoogleSignInAccount? googleUserAccount =
          await GoogleSignIn().signIn();

      // Obtain the auth details from the request   [ google account ]

      //* if the user dismissed the dialog, and chose no account
      if (googleUserAccount == null) {
        return null;
      }
      // if there is an account selected from the dialog
      // * this is a getter to return the token from the selected account email
      // this object [GoogleSignInAuthentication] contains  information about the authentication process, such as the Google ID token and access token.
      final GoogleSignInAuthentication googleAuth =
          await googleUserAccount.authentication;

      // Create a new credential

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth
            .accessToken, // represents the user's authorization to access Google services
        idToken: googleAuth
            .idToken, // represents the user's identity and can be used to verify the user's authenticity.
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


  // **********************  Email & password Authentication Process  **********************

  /// [EmailAndPasswordAuthentication] - login with email and password
  /// ! you must enable email and password in firebase console before you can use this method
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

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
    String email,
    String password,
  ) async {
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

  // [re-authenticate ]  -- re-authenticate user
   /// to re-authenticate the user [ auth for the second time ] 
   /// used before update operations to ensure that the user is still authenticated
  Future<void> reAuthenticateUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
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
      throw const CustomFormatException('');
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
//       //! throw only the message of that exception caught
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
