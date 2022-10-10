import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{
  late TextEditingController emailOrPhoneOrUsernameController, passwordController;

  final emailOrPhoneOrUsername =''.obs;
  final password = ''.obs;
  final emailOrPhoneOrUsernameNotEmpty = false.obs;
  final passwordNotEmpty = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailOrPhoneOrUsernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  updateEmailOrPhoneOrUsername(String text,bool value) {
    emailOrPhoneOrUsername(text);
    emailOrPhoneOrUsernameNotEmpty(value);
  }

  updatePassword(String text,bool value) {
    password(text);
    passwordNotEmpty(value);
  }

}