import 'dart:math';
import 'package:faker/faker.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/app/model/explore_data_model.dart';
import '../../utils/constants.dart';
import '../../utils/utils_function.dart';
import '../model/user_model.dart';
import 'comment_data.dart';

Random random = Random();
Faker faker = Faker();
final userInfo = GetStorage();

User selfUser() {
  return  User(
    verified: true,
    userName: userInfo.read(userNameKey),
    profileImageUrl: userInfo.read(userProfilePicKey),
    bio: '',
    fullName: '',
    stories: [],
  );
}

List<ImageItem> generatePostImages() {
  return List<ImageItem>.generate(
      (random.nextInt(30)+5),
    (index) {
      return ImageItem(
        user: selfUser(),
        images: generateImages(),
        comments: generateComments(),
        postBody: random.nextBool() == true ? faker.lorem.sentence() : '',
      );
    },
  );
}

List<ImageItem> generateTagImages() {
  return List<ImageItem>.generate(
    (random.nextInt(30)+5),
        (index) {
      return ImageItem(
        user: selfUser(),
        images: generateImages(),
        comments: generateComments(),
        postBody: random.nextBool() == true ? faker.lorem.sentence() : '',
      );
    },
  );
}
