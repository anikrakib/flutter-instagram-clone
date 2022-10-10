import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late TextEditingController emailController,
      passwordController,
      confirmationCodeController,
      confirmPasswordController,
      userNameController,
      phoneNumberController;
  final email = ''.obs;
  final password = ''.obs;
  final userName = ''.obs;
  final confirmPassword = ''.obs;
  final phoneNumber = ''.obs;
  final confirmationCode = ''.obs;
  final emailNotEmpty = false.obs;
  final phoneNumberNotEmpty = false.obs;
  final userNameNotEmpty = false.obs;
  final passwordNotEmpty = false.obs;
  final confirmPasswordNotEmpty = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    userNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    confirmationCodeController = TextEditingController();
  }

  updateEmail(String text,bool value) {
    email.value = text;
    emailNotEmpty(value);
  }

  updatePassword(String text,bool value) {
    password(text);
    passwordNotEmpty(value);
  }

  updateUserName(String text,bool value) {
    userName(text);
    userNameNotEmpty(value);
  }

  updateConfirmPassword(String text,bool value) {
    confirmPassword(text);
    confirmPasswordNotEmpty(value);
  }

  updatePhoneNumber(String text,bool value) {
    phoneNumber(text);
    phoneNumberNotEmpty(value);
  }
  updateCode(String text) {
    confirmationCode(text);
  }

}
