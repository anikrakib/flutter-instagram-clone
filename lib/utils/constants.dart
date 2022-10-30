import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/home_screen.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/post_screen/post_screen.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/profile_screen/profile_screen.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/search_screen/search_screen.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/shop%20screen/shop_screen.dart';

const userNameKey = "userName";
const passwordKey = "password";
const emailKey = "email";
const phoneKey = "phone";
const userProfilePicKey = "userProfilePic";
const isLoggedInKey = "isLoggedIn";

const defaultPadding = 18.0;
const appBarHeight = 56.0;
const myDayPadding = 7.0;
const myDayProfilePicSize = 60.0;
const videoSize = 650.0;

final screens = [
  const HomeScreen(),
  const SearchScreen(),
  const PostScreen(),
  const ShopScreen(),
  const ProfileScreen()
];
