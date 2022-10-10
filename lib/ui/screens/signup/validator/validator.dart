class Validator {
  static bool validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool validateUserName(String value) {
    String pattern = r'(^(?=[a-zA-Z0-9._]{6,15}$)(?!.*[_.]{2})[^_.].*[^_.]$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (value.length != 10) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool validateEmail(String value) {

    //String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}';
    //String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  /*
  Minimum 1 Upper case
  Minimum 1 lowercase
  Minimum 1 Numeric Number
  Minimum 1 Special Character
  */

  static bool validatePassword(String value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return false;
    } else {
      if (!regex.hasMatch(value)) {
        return false;
      } else {
        return true;
      }
    }
  }
}
