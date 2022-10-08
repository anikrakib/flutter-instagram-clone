
abstract class Routes {
  Routes._();
  static const SPLASH = Paths.SPLASH;
  static const HOME = Paths.HOME;
  static const SIGNIN = Paths.SIGNIN;
  static const SIGNUP = Paths.SIGNUP;
  static const SIGNUPWITHBOTH = Paths.SIGNUPWITHBOTH;
  static const EXISTINGACCOUNT = Paths.EXISTINGACCOUNT;
}

abstract class Paths {
  Paths._();
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const SIGNIN = '/signIn';
  static const SIGNUP = '/signUp';
  static const SIGNUPWITHBOTH = '/signUpWithBoth';
  static const EXISTINGACCOUNT = '/existingAccounts';
}