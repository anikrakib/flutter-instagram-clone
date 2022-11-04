import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/app/controller/nav_bar_controller.dart';
import 'package:instagram_clone/generated/assets.dart';
import 'package:instagram_clone/routes/app_routes.dart';
import 'package:instagram_clone/ui/app_widgets/app_image.dart';
import 'package:instagram_clone/ui/theme.dart';
import '../../../utils/constants.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final navBarController = Get.put(NavBarController());
  final userInfo = GetStorage();
  String userImage = '';

  @override
  void initState() {
    super.initState();
    if (userInfo.read('userProfilePic') != null) {
      userImage = userInfo.read('userProfilePic');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: screens[navBarController.index.value],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }

  NavigationBarTheme bottomNavigationBar(BuildContext context) {
    return NavigationBarTheme(
      data: const NavigationBarThemeData(
        indicatorColor: Colors.transparent,
      ),
      child: Container(
        height: 50,
        color: Get.isDarkMode ? AppColors.light : AppColors.dark,
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.only(top: 0.3),
            child: NavigationBar(
              backgroundColor: Get.isDarkMode
                  ? const Color(0xFF121212)
                  : const Color(0xFFFAFAFA),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              animationDuration: const Duration(
                seconds: 3,
              ),
              selectedIndex: navBarController.index.value,
              onDestinationSelected: (index) => {
                if (index == 2)
                  Get.toNamed(Routes.post)
                else
                  navBarController.updateIndex(index)
              },
              destinations: [
                NavigationDestination(
                  icon: navigationSVGImage(
                    context,
                    Assets.bottomNavbarIconHome,
                  ),
                  selectedIcon: navigationSVGImage(
                    context,
                    Assets.bottomNavbarIconHomeFill,
                  ),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: navigationSVGImage(
                    context,
                    Assets.bottomNavbarIconSearch,
                  ),
                  selectedIcon: navigationSVGImage(
                    context,
                    Assets.bottomNavbarIconSearchFill,
                  ),
                  label: 'Search',
                ),
                NavigationDestination(
                  icon: navigationSVGImage(
                    context,
                    Assets.bottomNavbarIconPost,
                  ),
                  label: 'Post',
                ),
                NavigationDestination(
                  icon: navigationSVGImage(
                    context,
                    Assets.bottomNavbarIconShop,
                  ),
                  selectedIcon: Get.isDarkMode
                      ? navigationSVGImageWithoutColor(
                          Assets.bottomNavbarIconWhiteShopFill,
                        )
                      : navigationSVGImageWithoutColor(
                          Assets.bottomNavbarIconBlackShopFill,
                        ),
                  label: 'Shop',
                ),
                NavigationDestination(
                  icon: SizedBox(
                    height: 22,
                    width: 22,
                    child: profileCircleAvatar(
                      context: context,
                      imageUrl: userImage,
                    ),
                  ),
                  label: 'Profile',
                  selectedIcon: profileCircleAvatarWithPadding(
                    context: context,
                    imageUrl: userImage,
                    radius: 12,
                    padding: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
