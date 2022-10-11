import 'package:get/get.dart';
import 'package:instagram_clone/app/binding/splash_screen_binding.dart';
import 'package:instagram_clone/routes/app_routes.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/nav_bar_screen.dart';
import 'package:instagram_clone/ui/screens/signin/signin_screen.dart';
import 'package:instagram_clone/ui/screens/signin_with_existing_account/sign_in_with_existing_account.dart';
import 'package:instagram_clone/ui/screens/signup/sign_up_with_email_and_phone/sign_up_with_email_and_phone.dart';
import 'package:instagram_clone/ui/screens/signup/signup_screen.dart';
import 'package:instagram_clone/ui/screens/splash_screen/splash_screen.dart';
import '../app/binding/auth_binding.dart';
import '../app/binding/nav_bar_binding.dart';
import '../app/binding/signup_binding.dart';
import '../ui/screens/nav_bar_screen/home_screen/home_screen.dart';
import '../ui/screens/signup/signup_other_information.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Paths.splash,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Paths.home,
      page: () => const HomeScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Paths.signIn,
      page: () => SignInScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Paths.signUp,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Paths.signupWithBoth,
      page: () => const SignUpWithEmailAndPhone(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Paths.existingAccount,
      page: () => const SignInWithExistingAccount(),
    ),
    GetPage(
      name: Paths.otherInformation,
      page: () => OtherInformation(),
    ),
    GetPage(
      name: Paths.navBarScreen,
      page: () => const NavBarScreen(),
      binding: NavBarBinding(),
    ),
  ];
}
