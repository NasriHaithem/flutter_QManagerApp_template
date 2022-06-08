import 'package:get/get.dart';

class CredentialsValidator {

  static String? validateRequiredInput(String value) {
    if (value == "") {
      return "requiredInputError".tr;
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "invalidEmailError".tr;
    }
    return null;
  }

  static String? validatePhone(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "invalidPhoneError".tr;
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.length < 6) {
      return "invalidPasswordError".tr;
    }
    return null;
  }

  static String? validateRepeatedPassword(String p1, String p2) {
    if(p1.length < 6) {
      return "invalidPasswordError".tr;
    }
    if (p1 != p2) {
      return "repeatPasswordErrorMsg".tr;
    }
    return null;
  }
}

