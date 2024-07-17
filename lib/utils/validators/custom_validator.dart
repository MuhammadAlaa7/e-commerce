class CValidator {
//***************** empty text validation ****************

  static String? validateEmptyText({String? fieldName, String? value}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // ******************* email validation *****************

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'email is required';
    }

// regular expression for email validation
// * the pattern follow this example:
// Valid Email: john.doe@example.com
//Valid Email: jane-doe@mail.example.co.uk

    final RegExp emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }

    return null;
  }

// ******************* password validation *****************

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'password is required';
    }

    // check if password is at least 8 characters long
    if (value.length < 8) {
      return 'password must be at least 8 characters long';
    }

    // check for uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'password must contain at least one capital letter';
    }

// check for numbers in the password
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'password must contain at least one number';
    }

// check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'password must contain at least one special character';
    }

    return null;
  }

// ******************* for phone number validation *****************

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'phone number is required';
    }

// regular expression for phone number validation
    final RegExp phoneRegExp = RegExp(r"^\d{11}$");

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (11 digits required )';
    }

    return null;
  }
}
