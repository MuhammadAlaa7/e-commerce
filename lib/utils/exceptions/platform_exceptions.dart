class CustomPlatformException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  CustomPlatformException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'missing-action-code':
        return 'The action code is missing. Please provide a valid action code.';

      case 'user-token-expired':
        return 'The user\'s token has expired, and authentication is required. Please sign in again.';

      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials.';

      case 'expired-action-code':
        return 'The action code has expired. Please request a new action code.';

      case 'invalid-action-code':
        return 'The action code is invalid. Please check the code and try again.';

      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      // Add more cases as needed...
      default:
        return "An Unknown Platform error occurred. Please try again.";
    }
  }
}
