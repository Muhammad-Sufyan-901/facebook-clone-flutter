abstract class InputValidator {
  static String? validateInput({
    String? value,
    bool? additionalCheck,
    required String errorMessage,
  }) {
    if (value == null ||
        value.isEmpty ||
        value.trim().isEmpty ||
        (additionalCheck != null && additionalCheck)) {
      return errorMessage;
    }

    return null;
  }

  static String? validateUsername(String? value) {
    return validateInput(
      value: value,
      errorMessage:
          'Username harus memiliki minimal 3 karakter dan tidak boleh lebih dari 200 karakter',
      additionalCheck: (value!.length < 3 && value.length > 200),
    );
  }

  static String? validateEmail(String? value) {
    return validateInput(
      value: value,
      errorMessage:
          'Masukkan email yang valid dan tidak boleh lebih dari 150 karakter',
      additionalCheck: (!value!.contains('@') && value.length > 150),
    );
  }

  static String? validatePassword(String? value) {
    return validateInput(
      value: value,
      errorMessage: 'Password harus minimal 6 karakter',
      additionalCheck: value!.length < 6,
    );
  }

  static String? confirmPassword(String? value, String? password) {
    return validateInput(
      value: value,
      errorMessage: 'Password tidak cocok',
      additionalCheck: value != password,
    );
  }
}
