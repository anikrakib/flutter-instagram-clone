import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/ui/app_widgets/action_button_text.dart';
import 'package:instagram_clone/ui/app_widgets/app_image.dart';
import 'package:instagram_clone/ui/app_widgets/custom_action_button.dart';
import 'package:instagram_clone/ui/app_widgets/widgets.dart';
import 'package:instagram_clone/utils/constants.dart';
import '../../../routes/app_routes.dart';
import '../../app_widgets/screen_footer.dart';
import '../../theme.dart';

class SignInWithExistingAccount extends StatefulWidget {
  const SignInWithExistingAccount({Key? key}) : super(key: key);

  @override
  State<SignInWithExistingAccount> createState() =>
      _SignInWithExistingAccountState();
}

class _SignInWithExistingAccountState extends State<SignInWithExistingAccount> {
  final userInfo = GetStorage();

  String userName = '';
  String profilePic = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    if (userInfo.read('userName') != null &&
        userInfo.read('password') != null &&
        userInfo.read('userProfilePic') != null) {
      userName = userInfo.read('userName');
      profilePic = userInfo.read('userProfilePic');
      password = userInfo.read('password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appLogo(context),
                    sizeBox(50),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage: NetworkImage(
                          profilePic,
                        ),
                      ),
                    ),
                    sizeBox(20),
                    Text(
                      userName,
                      style: AppTextStyle.textStyleFaded,
                    ),
                    sizeBox(20),
                    customActionButton(
                        actionButtonText('Log In', true), true, action),
                    sizeBox(20),
                    bottomButton(text: 'Remove'),
                  ],
                ),
              ),
            ),
            bottomPart(
              Row(
                children: [
                  Expanded(
                    child: bottomButton(
                      routes: Routes.signIn,
                      text: 'Switch Accounts',
                    ),
                  ),
                  Container(
                    width: 0.8,
                    height: double.infinity,
                    color: AppColors.faded,
                  ),
                  Expanded(
                    child: bottomButton(
                      routes: Routes.signUp,
                      text: 'Sign Up',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  action() {
    if (userInfo.read('userName') != null &&
        userInfo.read('password') != null) {
      Get.offNamed(Routes.navBarScreen);
    }
  }

  MaterialButton bottomButton({
    String? routes,
    required String text,
  }) {
    return MaterialButton(
      onPressed: () {
        Get.toNamed(routes!);
      },
      child: Center(
        child: Text(
          text,
          style: AppTextStyle.textStyleActionBlue,
        ),
      ),
    );
  }
}
