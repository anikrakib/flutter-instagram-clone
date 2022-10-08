import 'package:get/get.dart';
import 'package:instagram_clone/app/binding/splash_screen_binding.dart';
import 'package:instagram_clone/routes/app_routes.dart';
import 'package:instagram_clone/ui/screens/home/home_screen.dart';
import 'package:instagram_clone/ui/screens/signin/signin_screen.dart';
import 'package:instagram_clone/ui/screens/signin_with_existing_account/sign_in_with_existing_account.dart';
import 'package:instagram_clone/ui/screens/signup/sign_up_with_email_and_phone/sign_up_with_email_and_phone.dart';
import 'package:instagram_clone/ui/screens/signup/signup_screen.dart';
import 'package:instagram_clone/ui/screens/splash_screen/splash_screen.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Paths.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Paths.HOME,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Paths.SIGNIN,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: Paths.SIGNUP,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: Paths.SIGNUPWITHBOTH,
      page: () => const SignUpWithEmailAndPhone(),
    ),
    GetPage(
      name: Paths.EXISTINGACCOUNT,
      page: () => const SignInWithExistingAccount(),
    ),
  ];
}