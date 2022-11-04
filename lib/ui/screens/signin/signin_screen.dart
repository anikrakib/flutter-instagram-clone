import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/app/controller/signin_controller.dart';
import 'package:instagram_clone/app/controller/signup_controller.dart';
import 'package:instagram_clone/generated/assets.dart';
import 'package:instagram_clone/routes/app_routes.dart';
import 'package:instagram_clone/ui/app_widgets/action_button_text.dart';
import 'package:instagram_clone/ui/app_widgets/app_image.dart';
import 'package:instagram_clone/ui/app_widgets/sizeBox.dart';
import 'package:instagram_clone/ui/theme.dart';
import 'package:instagram_clone/utils/constants.dart';
import '../../app_widgets/custom_action_button.dart';
import '../../app_widgets/input_text_field_decoration.dart';
import '../../app_widgets/screen_footer.dart';
import '../../app_widgets/custom_text.dart';
import '../signup/validator/validator.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final signInController = Get.put(SignInController());

  final signUpController = Get.put(SignUpController());

  final userInfo = GetStorage();

  String uName = '';
  String password = '';
  String email = '';
  String phone = '';

  @override
  void initState() {
    super.initState();
    if (userInfo.read(userNameKey) != null &&
        userInfo.read(passwordKey) != null &&
        userInfo.read(phoneKey) != null &&
        userInfo.read(emailKey) != null) {
      uName = userInfo.read(userNameKey);
      password = userInfo.read(passwordKey);
      phone = userInfo.read(phoneKey);
      email = userInfo.read(emailKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      sizeBox(appBarHeight),
                      mainBody(width, context, signInController),
                      bottomPart(
                        customText('Don\'t Have an Account? ', 'Sign Up'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Padding mainBody(
    double width,
    context,
    SignInController signInController,
  ) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          appLogo(context),
          sizeBox(25.0),
          TextField(
            controller: signInController.emailOrPhoneOrUsernameController,
            keyboardType: TextInputType.text,
            decoration:
                inputTextFieldDecoration('Phone Number, email, or username'),
            obscureText: false,
            enableSuggestions: false,
            autocorrect: false,
            onChanged: (value) {
              signInController.updateEmailOrPhoneOrUsername(
                  value,
                  (Validator.validateEmail(value) ||
                      Validator.validateUserName(value) ||
                      Validator.validateMobile(value)));
            },
          ),
          sizeBox(15),
          TextField(
            controller: signInController.passwordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: inputTextFieldDecoration('Password'),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            onChanged: (value) {
              signInController.updatePassword(
                  value, Validator.validatePassword(value));
            },
          ),
          sizeBox(15.0),
          Obx(
            () {
              bool empty =
                  (signInController.emailOrPhoneOrUsernameNotEmpty.value &&
                      signInController.passwordNotEmpty.value);
              return customActionButton(
                  actionButtonText('Log In', empty), empty, action);
            },
          ),
          sizeBox(15.0),
          customText('Forgot your login details?', ' Get help logging in.'),
          sizeBox(20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: (width * .8) / 2,
                height: 0.2,
                color: AppColors.faded,
              ),
              const Text(
                'OR',
                style: TextStyle(
                  color: AppColors.faded,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: (width * .8) / 2,
                height: 0.2,
                color: AppColors.faded,
              )
            ],
          ),
          sizeBox(20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.iconsIconFacebook,
              ),
              sizeBox(8.0),
              const Text(
                'Continue as Facebook',
                style: AppTextStyle.textStyleActionBlue,
              )
            ],
          ),
        ],
      ),
    );
  }

  action() {
    if ((uName == signInController.emailOrPhoneOrUsername.value.toString() ||
            email == signInController.emailOrPhoneOrUsername.value.toString() ||
            phone ==
                signInController.emailOrPhoneOrUsername.value.toString()) &&
        password == signInController.password.value.toString()) {
      Get.offNamed(Routes.navBarScreen);
    }else{
      Get.snackbar('Error', 'Incorrect Credential');
    }
  }
}
