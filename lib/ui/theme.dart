import 'package:flutter/material.dart';

/// Global reference to application colors.
abstract class AppColors {
  /// Dark color.
  //static const dark = Color(0xFF000000);
  static const dark = Color(0xFF010001);

  static const light = Color(0xFFFFFFFF);

  /// Grey background accent.
  static const grey = Color(0xFF262626);

  /// postImagePreviewBackgroundDArkMode
  static const postImagePreviewBackgroundDarkMode = Color(0xFF363737);

  /// postImagePreviewBackgroundDArkMode
  static const postImagePreviewBackgroundLightMode = Color(0xFFefefef);

  ///  Light Grey color
  static const lightBlackGrey = Color(0xFF363737);

  /// Primary text color
  static const primaryText = Colors.white;

  /// Secondary color.
  static const secondary = Color(0xFF0095F6);

  /// Color to use for favorite icons (indicating a like).
  static const like = Colors.red;

  /// Grey faded color.
  static const faded = Colors.grey;

  /// Light grey color
  static const lightGrey = Color(0xFFFAFAFA);

  /// Top gradient color used in various UI components.
  static const topGradient = Color(0xFFE20337);

  /// Mid gradient color used in various UI components.
  static const midGradient = Color(0xFFC60188);

  /// Bottom gradient color used in various UI components.
  static const bottomGradient = Color(0xFF7700C3);
}

/// Global reference to application [TextStyle]s.
abstract class AppTextStyle {
  /// A medium bold text style.
  static const textStyleBoldMedium = TextStyle(
    fontWeight: FontWeight.w600,
  );

  static const textStyleBoldMediumWhiteText =
      TextStyle(fontWeight: FontWeight.w600, color: AppColors.light);

  /// A bold text style.
  static const textStyleBold = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static const textStyleNormal = TextStyle(
    fontWeight: FontWeight.w400,
  );

  static const reelsTextStyle = TextStyle(
      fontSize: 13, color: AppColors.light, fontWeight: FontWeight.w400);

  static const commentReelsTextStyle = TextStyle(
      fontSize: 6, color: AppColors.light, fontWeight: FontWeight.w400);

  static const textStyleFaded = TextStyle(
      color: AppColors.faded, fontWeight: FontWeight.w400, fontSize: 20);

  static const textStyleFacebook = TextStyle(
      color: AppColors.faded, fontWeight: FontWeight.w600, fontSize: 22);

  /// A faded text style. Uses [AppColors.faded].
  static const textStyleFadedSmall = TextStyle(
      color: AppColors.faded, fontWeight: FontWeight.w400, fontSize: 12);

  /// A faded text style. Uses [AppColors.faded].
  static const textStyleFadedSmallBold = TextStyle(
      color: AppColors.faded, fontWeight: FontWeight.w500, fontSize: 12);

  /// Light text style.
  static const textStyleLight = TextStyle(fontWeight: FontWeight.w300);

  /// Action text
  static const textStyleActionBlue =
      TextStyle(fontWeight: FontWeight.w700, color: AppColors.secondary);

  /// Action text
  static const settingTextStyleActionBlue =
  TextStyle(fontWeight: FontWeight.w400, color: AppColors.secondary);

  static const textStyleActionBlueBig = TextStyle(
      fontWeight: FontWeight.w700, color: AppColors.secondary, fontSize: 16);

  static const textStyleBig =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16);

  static const bottomSheetTextStyle =
  TextStyle(fontWeight: FontWeight.w400, fontSize: 16);

  static const profilePageLargeFontStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  static const profilePageMediumFontStyle =
  TextStyle(fontSize: 15, fontWeight: FontWeight.w400);

  static const profilePageSmallFontStyle =
  TextStyle(fontSize: 13, fontWeight: FontWeight.normal);

  static const textStyleSmall =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 13);

  static const textStyleSmallBold =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 12);
}

/// Global reference to the application theme.
class AppTheme {
  final _darkBase = ThemeData.dark();
  final _lightBase = ThemeData.light();

  /// Dark theme and its settings.
  ThemeData get darkTheme => _darkBase.copyWith(
        primaryColor: AppColors.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: AppColors.dark,
        scaffoldBackgroundColor: AppColors.dark,
        appBarTheme: _darkBase.appBarTheme.copyWith(
          backgroundColor: AppColors.dark,
          foregroundColor: AppColors.light,
          iconTheme: const IconThemeData(color: AppColors.light),
          elevation: 0,
        ),
        bottomNavigationBarTheme: _darkBase.bottomNavigationBarTheme.copyWith(
          selectedItemColor: AppColors.light,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              const BorderSide(
                color: AppColors.grey,
              ),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.light,
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.dark,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.grey,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.secondary,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.secondary,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.grey,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.secondary,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.grey,
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                color: AppColors.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        brightness: Brightness.dark,
        colorScheme:
            _darkBase.colorScheme.copyWith(secondary: AppColors.secondary),
      );

  ThemeData get lightTheme => _lightBase.copyWith(
        primaryColor: AppColors.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: AppColors.light,
        scaffoldBackgroundColor: AppColors.light,
        appBarTheme: _lightBase.appBarTheme.copyWith(
          backgroundColor: AppColors.light,
          foregroundColor: AppColors.dark,
          iconTheme: const IconThemeData(color: AppColors.dark),
          elevation: 0,
        ),
        bottomNavigationBarTheme: _lightBase.bottomNavigationBarTheme.copyWith(
          selectedItemColor: AppColors.dark,
        ),
        snackBarTheme:
            _lightBase.snackBarTheme.copyWith(backgroundColor: AppColors.dark),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              const BorderSide(
                color: AppColors.lightGrey,
              ),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.dark,
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.light,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.lightGrey,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.secondary,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.secondary,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.secondary,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.secondary,
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                color: AppColors.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.lightGrey,
            ),
          ),
        ),
        brightness: Brightness.light,
        colorScheme: _lightBase.colorScheme.copyWith(
          secondary: AppColors.secondary,
        ),
      );
}
