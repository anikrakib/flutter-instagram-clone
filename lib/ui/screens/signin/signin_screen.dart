import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/generated/assets.dart';
import 'package:instagram_clone/ui/app_widgets/app_logo.dart';
import 'package:instagram_clone/ui/app_widgets/sizeBox.dart';
import 'package:instagram_clone/ui/theme.dart';
import '../../app_widgets/custom_action_button.dart';
import '../../app_widgets/screen_footer.dart';
import 'component/custom_text.dart';
import 'component/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar:null,
      /*AppBar(
        actions: [
          Switch(
            value: true,
            onChanged: (value) {

            },
          ),
        ],
      ),*/
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            sizeBox(56),
            mainBody(width),
            bottomPart(
              customText('Don\'t Have an Account? ', 'Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

Padding mainBody(double width) {
  return Padding(
    padding: const EdgeInsets.all(18),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        appLogo(),
        sizeBox(25.0),
        usernameOrPasswordTextField('Phone Number, email, or username', false),
        sizeBox(15.0),
        usernameOrPasswordTextField('Password', true),
        sizeBox(15.0),
        customActionButton(
          const Text('Log In'),
          false,
        ),
        sizeBox(15.0),
        customText('Forgot your login details?', ' Get help logging in.'),
        sizeBox(20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: (width*.8)/2,
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
              width: (width*.8)/2,
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
