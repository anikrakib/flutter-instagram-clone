import 'dart:math';
import 'package:faker/faker.dart';
import 'package:instagram_clone/app/data/comment_data.dart';
import 'package:instagram_clone/app/data/user_data.dart';
import '../../utils/utils_function.dart';
import '../model/view_type.dart';

var faker = Faker();

var postList = List<ListItem>.generate(
  20,
  (index) {
    var random = Random();
    if ((index) % 6 == 0 && index != 0) {
      // generate random unique number for userImage
      List<int> numberList = [];
      while (numberList.length < 5) {
        int randomNumber = random.nextInt(50);
        if (!numberList.contains(randomNumber)) {
          numberList.add(randomNumber);
        }
      }
      return SuggestUsers(
        suggestUsers: List<SuggestUser>.generate(5, (i) {
          String menOrWomen = random.nextBool() == true ? 'women' : 'men';
          return SuggestUser(
            userName: faker.internet.userName(),
            userImage:
                'https://randomuser.me/api/portraits/$menOrWomen/${numberList[i]}.jpg',
          );
        }),
      );
    } else if ((index) % 2 == 0 && index != 0) {
      String menOrWomen = random.nextBool() == true ? 'women' : 'men';
      return AddItem(
        addName: faker.company.name(),
        addImage:
            'https://randomuser.me/api/portraits/$menOrWomen/${random.nextInt(85)}.jpg',
        images: generateImages(),
        addPost: random.nextBool() == true ? faker.lorem.sentence() : '',
        comments: generateComments(),
      );
    }
    String menOrWomen = random.nextBool() == true ? 'women' : 'men';
    return PostItem(
      user: generateUser(),
      postUserImage:
          'https://randomuser.me/api/portraits/$menOrWomen/${random.nextInt(85)}.jpg',
      images: generateImages(),
      postBody: random.nextBool() == true ? faker.lorem.sentence() : '',
      comments: generateComments(),
      time: DateTime.now(),
    );
  },
);
