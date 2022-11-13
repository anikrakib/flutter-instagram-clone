import 'package:get/get.dart';
import 'package:instagram_clone/app/binding/splash_screen_binding.dart';
import 'package:instagram_clone/routes/app_routes.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/comment_screen/comments_screen.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/nav_bar_screen.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/new_post_screen/component/screen/user_post_screen/user_post_screen.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/new_post_screen/new_post_screen.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/shop%20screen/shop_screen.dart';
import 'package:instagram_clone/ui/screens/settings_screen/settings_screen.dart';
import 'package:instagram_clone/ui/screens/signin/signin_screen.dart';
import 'package:instagram_clone/ui/screens/signin_with_existing_account/sign_in_with_existing_account.dart';
import 'package:instagram_clone/ui/screens/signup/sign_up_with_email_and_phone/sign_up_with_email_and_phone.dart';
import 'package:instagram_clone/ui/screens/signup/signup_screen.dart';
import 'package:instagram_clone/ui/screens/splash_screen/splash_screen.dart';
import '../app/binding/auth_binding.dart';
import '../app/binding/nav_bar_binding.dart';
import '../app/binding/shop_binding.dart';
import '../app/binding/signup_binding.dart';
import '../app/binding/user_post_binding.dart';
import '../ui/screens/explore_screen/explore_screen.dart';
import '../ui/screens/nav_bar_screen/home_screen/home_screen.dart';
import '../ui/screens/nav_bar_screen/shop screen/screen/search_product_screen.dart';
import '../ui/screens/signup/signup_other_information.dart';
import '../ui/screens/theme_change_screen/theme_change_screen.dart';

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
      page: () => const SignInScreen(),
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
    GetPage(
      name: Paths.comments,
      page: () => const Comments(
        allComments: [],
      ),
    ),
    GetPage(
      name: Paths.explore,
      page: () => const ExploreScreen(),
    ),
    GetPage(
      name: Paths.post,
      page: () => const PostScreen(),
    ),
    GetPage(
      name: Paths.userPost,
      page: () => const UserPostScreen(),
      binding: UserPostBinding(),
    ),
    GetPage(
      name: Paths.shop,
      page: () => const ShopScreen(),
      binding: ShopBinding(),
    ),
    GetPage(
      name: Paths.searchProduct,
      page: () => const SearchProductScreen(),
    ),
    GetPage(
      name: Paths.settings,
      page: () => SettingsScreen(),
    ),
    GetPage(
      name: Paths.themeChange,
      page: () => const ThemeChangeScreen(),
    ),
  ];
}
