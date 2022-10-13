import 'dart:math';
import 'package:faker/faker.dart';
import 'package:instagram_clone/app/data/comment_data.dart';
import 'package:intl/intl.dart';
import '../model/view_type.dart';

var faker = Faker();

var postList = List<ListItem>.generate(
  50,
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
      return random.nextBool() == true
          ? AddItem(
              addName: faker.company.name(),
              addImage: 'https://source.unsplash.com/random?sig=$index',
              comments: generateComments(),
            )
          : AddItem(
              addName: faker.company.name(),
              addImage: 'https://source.unsplash.com/random?sig=$index',
              addPost: faker.lorem.sentence(),
              comments: generateComments(),
            );
    }
    return random.nextBool() == true
        ? PostItem(
            postUserName: faker.internet.userName(),
            postImage: 'https://source.unsplash.com/random?sig=$index',
            comments: generateComments(),
            time: DateTime.now(),
          )
        : PostItem(
            postUserName: faker.internet.userName(),
            postImage: 'https://source.unsplash.com/random?sig=$index',
            postBody: faker.lorem.sentence(),
            comments: generateComments(),
            time: DateTime.now(),
          );
  },
);