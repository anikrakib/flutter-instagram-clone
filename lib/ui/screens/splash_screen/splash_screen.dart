import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/ui/theme.dart';
import 'package:instagram_clone/generated/assets.dart';
import 'package:instagram_clone/ui/app_widgets/sizeBox.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: SvgPicture.asset(
                    Assets.assetsAppIcon,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'from',
                        style: AppTextStyle.textStyleFaded,
                      ),
                      sizeBox(5),
                      Text(
                        'F A C E B O O K',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradientFacebook,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Linear Gradient Used in Splash Screen.
final Shader linearGradientFacebook = const LinearGradient(
  colors: <Color>[
    Color(0xFFFBAA47),
    Color(0xFFFBAA47),
    Color(0xFFFBAA47),
    Color(0xFFD91A46),
    Color(0xFFA60F93)
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
