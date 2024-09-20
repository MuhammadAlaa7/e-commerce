class CustomFirebaseException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  CustomFirebaseException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'unknown':
        return 'An Unknown Firebase error occurred. Please try again.';
      case 'invalid-custom-token':
        return "The custom token format is incorrect. Please check your custom token.";
      case 'custom-token-mismatch':
        return "The custom token corresponds to a different audience.";
      case 'user-disabled':
        return "The user account has been disabled.";
      case 'user-not-found':
        return "No user found for the given email or ID.";
      case 'invalid-email':
        return "The email address provided is invalid. Please enter a valid email.";
      case 'email-already-in-use':
        return "The email address is already registered. Please use a different email.";
      case 'wrong-password':
        return "Incorrect password. Please check your password and try again.";
      case 'weak-password':
        return "The password is too weak. Please choose a stronger password.";
      case 'provider-already-linked':
        return "The account is already linked with another provider.";
      case 'operation-not-allowed':
        return "This operation is not allowed. Contact support for assistance.";

      // Add more Firebase error codes and messages here
      case 'invalid-credential':
        return 'The provided credential is invalid.';
      case 'invalid-verification-code':
        return 'The provided verification code is invalid.';
      case 'invalid-verification-id':
        return 'The provided verification ID is invalid.';
      case 'argument-error':
        return 'An invalid argument was provided to a Firebase function.';
      case 'timeout':
        return 'A timeout occurred while communicating with Firebase servers.';
      case 'quota-exceeded':
        return 'The quota for this operation has been exceeded.';
      case 'cancelled':
        return 'The operation was cancelled.';
      case 'network-error':
        return 'A network error occurred while communicating with Firebase.';
      case 'internal-error':
        return 'An internal error occurred in the Firebase backend.';
      case 'invalid-api-key':
        return 'The provided API key is invalid.';
      case 'permission-denied':
        return 'The current user does not have permission to perform this operation.';
      case 'missing-android-configuration-file':
        return 'The Android configuration file for Firebase is missing.';
      case 'missing-ios-plist-file':
        return 'The iOS plist file for Firebase is missing.';
      case 'unverified-email':
        return 'The user\'s email address is not verified.';
      default:
        return "An error occurred during the Firebase operation. Please try again.";
    }
  }
}
