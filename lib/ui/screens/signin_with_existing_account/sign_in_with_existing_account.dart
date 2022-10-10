import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/ui/app_widgets/app_logo.dart';
import 'package:instagram_clone/ui/app_widgets/custom_action_button.dart';
import 'package:instagram_clone/ui/app_widgets/sizeBox.dart';
import '../../../app/controller/theme_controller.dart';
import '../../../routes/app_routes.dart';
import '../../app_widgets/screen_footer.dart';
import '../../theme.dart';

class SignInWithExistingAccount extends StatelessWidget {
  SignInWithExistingAccount({Key? key}) : super(key: key);
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(
          onPressed: () {
            if (Get.isDarkMode) {
              themeController.changeTheme(AppTheme().lightTheme);
              themeController.saveTheme(false);
            } else {
              themeController.changeTheme(AppTheme().darkTheme);
              themeController.saveTheme(true);
            }
          },
          icon: Get.isDarkMode
              ? const Icon(Icons.light_mode_outlined)
              : const Icon(Icons.dark_mode_outlined),),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
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
                          'https://randomuser.me/api/portraits/men/${random
                              .nextInt(100)}.jpg',
                        ),
                      ),
                    ),
                    sizeBox(20),
                    const Text(
                      'anik__rakib',
                      style: AppTextStyle.textStyleFaded,
                    ),
                    sizeBox(20),
                    customActionButton(
                        const Text(
                          'Log In',
                          style: TextStyle(
                              color: AppColors.light,
                              fontWeight: FontWeight.w800,
                              fontSize: 11),
                        ),
                        true),
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
                      routes: Routes.SIGNIN,
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
                      routes: Routes.SIGNUP,
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
