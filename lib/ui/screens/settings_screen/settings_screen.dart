import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../generated/assets.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constants.dart';
import '../../app_widgets/app_image.dart';
import '../../app_widgets/widgets.dart';
import '../../theme.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final userInfo = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: defaultPadding, right: defaultPadding),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizeBox(20),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 5.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Get.isDarkMode
                            ? const Color(0xff272627)
                            : const Color(0xffeeefee),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: svgImageWithColor(
                            15,
                            15,
                            Assets.bottomNavbarIconSearchFill,
                            AppColors.faded,
                          ), // icon is 48px widget.
                        ),
                        hintText: 'Search...',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: AppColors.faded,
                        ),
                      ),
                    ),
                  ),
                  sizeBox(20),
                  iconAndTextListTile(
                    context,
                    'Follow and invite friends',
                    icons: Icons.person_add_outlined,
                  ),
                  sizeBox(20),
                  iconAndTextListTile(
                    context,
                    'Notification',
                    path: Assets.iconsIconNotification,
                  ),
                  sizeBox(20),
                  iconAndTextListTile(
                    context,
                    'Supervision',
                    icons: Icons.people_outline,
                  ),
                  sizeBox(20),
                  iconAndTextListTile(
                    context,
                    'Security',
                    path: Assets.iconsIconSecurity,
                  ),
                  sizeBox(20),
                  iconAndTextListTile(
                    context,
                    'Ads',
                    path: Assets.iconsIconAds,
                  ),
                  sizeBox(20),
                  iconAndTextListTile(
                    context,
                    'Account',
                    path: Assets.iconsIconAccount,
                  ),
                  sizeBox(20),
                  iconAndTextListTile(
                    context,
                    'Help',
                    path: Assets.iconsIconHelp,
                  ),
                  sizeBox(20),
                  iconAndTextListTile(
                    context,
                    'About',
                    path: Assets.iconsIconAbout,
                  ),
                  sizeBox(20),
                  iconAndTextListTile(
                    context,
                    'Theme',
                    path: Assets.iconsIconTheme,
                    routesPath: Routes.themeChange,
                  ),
                  sizeBox(40),
                  svgImageWithColor(12, 60, Assets.iconsIconMetaAndLogo,
                      Theme.of(context).primaryColor),
                  sizeBox(10),
                  const Text(
                    'Accounts Center',
                    style: AppTextStyle.settingTextStyleActionBlue,
                  ),
                  sizeBox(10),
                  const Text(
                    'Control settings for connected experiences across Instagram, the Facebook app and Messenger, including story and post sharing and logging in.',
                    style: AppTextStyle.textStyleFadedSmall,
                  ),
                  sizeBox(40),
                  const Text('Logins'),
                  sizeBox(20),
                  const Text(
                    'Add account',
                    style: AppTextStyle.settingTextStyleActionBlue,
                  ),
                  sizeBox(20),
                  GestureDetector(
                    onTap: (){
                      userInfo.write(isLoggedInKey, false);
                      Get.offNamed(Routes.existingAccount);
                    },
                    child: const Text(
                      'Log out',
                      style: AppTextStyle.settingTextStyleActionBlue,
                    ),
                  ),
                  sizeBox(40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
