import 'package:flutter/material.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/home_screen/home_screen.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/new_post_screen/new_post_screen.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/profile_screen/profile_screen.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/search_screen/search_screen.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/shop%20screen/shop_screen.dart';
import '../ui/screens/nav_bar_screen/new_post_screen/component/screen/live_post_screen/live_post_screen.dart';
import '../ui/screens/nav_bar_screen/new_post_screen/component/screen/reel_post_screen/reel_post_screen.dart';
import '../ui/screens/nav_bar_screen/new_post_screen/component/screen/story_post_screen/component/camera_section.dart';
import '../ui/screens/nav_bar_screen/new_post_screen/component/screen/story_post_screen/component/image_section.dart';
import '../ui/screens/nav_bar_screen/new_post_screen/component/screen/story_post_screen/story_post_screen.dart';
import '../ui/screens/nav_bar_screen/new_post_screen/component/screen/user_post_screen/user_post_screen.dart';


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

final List<String> lists = ['POST', 'STORY', 'REEL', 'LIVE'];

final listStoryPostScreenPage = [CameraSection(), ImageSection()];

final List<Widget> newPostPages = [
  const UserPostScreen(),
  StoryPostScreen(),
  const ReelPostScreen(),
  const LivePostScreen()
];
