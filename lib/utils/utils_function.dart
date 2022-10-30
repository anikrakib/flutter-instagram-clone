import 'dart:math';
import 'package:get/get.dart';
import 'package:instagram_clone/app/model/explore_data_model.dart';
import 'package:instagram_clone/app/model/view_type.dart';

goTOAnotherPage(String path) => Get.toNamed(path);

goTOCommentsPageWithArguments({
  required String path,
  PostItem? postItem,
  AddItem? addItem,
  required ListItem listItem,
  required controller,
}) =>
    Get.toNamed(
      path,
      arguments: [
        postItem,
        addItem,
        listItem,
        controller,
      ],
    );

goTOExplorePageWithArguments({
  required String path,
  ImageItem? image,
  int? position,
}) =>
    Get.toNamed(
      path,
      arguments: [
        image,
        position,
      ],
    );

String timeAgo(DateTime postTime, bool numericDates) {
  final date2 = DateTime.now();
  final difference = date2.difference(postTime);

  if ((difference.inDays / 7).floor() >= 1) {
    return (numericDates) ? '1 week ago' : 'Last week';
  } else if (difference.inDays >= 2) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays >= 1) {
    return (numericDates) ? '1 day ago' : 'Yesterday';
  } else if (difference.inHours >= 2) {
    return '${difference.inHours} hours ago';
  } else if (difference.inHours >= 1) {
    return (numericDates) ? '1 hour ago' : 'An hour ago';
  } else if (difference.inMinutes >= 2) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inMinutes >= 1) {
    return (numericDates) ? '1 minute ago' : 'A minute ago';
  } else if (difference.inSeconds >= 3) {
    return '${difference.inSeconds} seconds ago';
  } else {
    return 'Just now';
  }
}

List<String> generateImages (){
  return List<String>.generate(
    Random().nextInt(4) + 1,
        (i) => 'https://picsum.photos/seed/image${Random().nextInt(150)}/500/800',
  );
}

List<int> reelsIndexNumb(int length){
  List<int> list = [];
  var pointer = 2;
  var increment = 9;

  for (int i = 0; i < length; i++){
    if (i == pointer) {
      pointer += increment;
      if (increment == 9) {
        list.add(i);
        increment = 13;
      } else if(increment == 13){
        list.add(i);
        increment = 9;
      }
    }
  }
  return list;
}
