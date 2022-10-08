import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/generated/assets.dart';
import 'package:instagram_clone/ui/app_widgets/custom_action_button.dart';
import 'package:instagram_clone/ui/app_widgets/sizeBox.dart';
import 'package:instagram_clone/ui/theme.dart';
import '../../../routes/app_routes.dart';
import '../../app_widgets/app_logo.dart';
import '../../app_widgets/screen_footer.dart';
import '../signin/component/custom_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            sizeBox(56),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  appLogo(),
                  sizeBox(80),
                  customActionButton(
                    textWithIcon('Continue as Facebook'),
                    true,
                  ),
                  sizeBox(50),
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
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(Routes.SIGNUPWITHBOTH);
                    },
                    child: const Text(
                      'Sign Up With Email or Phone number',
                      style: AppTextStyle.textStyleActionBlue,
                    ),
                  )
                ],
              ),
            ),
            bottomPart(
              customText('Already have an account? ', 'Log In'),
            )
          ],
        ),
      ),
    );
  }

  Row textWithIcon(String text) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.secondary,
            child: Icon(
              Icons.facebook,
              color: AppColors.light,
              size: 20,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
                color: AppColors.light, fontWeight: FontWeight.w800),
          )
        ],
      );

}
