
abstract class Routes {
  Routes._();
  static const splash = Paths.splash;
  static const home = Paths.home;
  static const signIn = Paths.signIn;
  static const signUp = Paths.signUp;
  static const signUpWithBoth = Paths.signupWithBoth;
  static const existingAccount = Paths.existingAccount;
  static const otherInformation = Paths.otherInformation;
  static const navBarScreen = Paths.navBarScreen;
  static const comments = Paths.comments;
  static const explore = Paths.explore;
  static const post = Paths.post;
  static const shop = Paths.shop;
  static const searchProduct = Paths.searchProduct;
}

abstract class Paths {
  Paths._();
  static const splash = '/splash';
  static const home = '/home';
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const signupWithBoth = '/signUpWithBoth';
  static const existingAccount = '/existingAccounts';
  static const otherInformation = '/otherInformation';
  static const shop = '/shop';
  static const navBarScreen = '/navBar';
  static const comments = '/comments';
  static const explore = '/explore';
  static const post = '/post';
  static const userPost = '/userPost';
  static const searchProduct = '/searchProduct';
}