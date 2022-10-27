import 'dart:math';
import 'package:faker/faker.dart';
import 'package:instagram_clone/app/data/story_data.dart';
import 'package:instagram_clone/app/model/story_model.dart';
import 'package:instagram_clone/app/model/user_model.dart';

var faker = Faker();
var random = Random();

List<User> generateUsers() {
  return List<User>.generate(
    30,
    (userIndex) {
      String menOrWomen = random.nextBool() == true ? 'women' : 'men';

      return User(
        verified: random.nextBool(),
        userName: faker.internet.userName(),
        profileImageUrl:
            'https://randomuser.me/api/portraits/$menOrWomen/$userIndex.jpg',
        bio: faker.lorem.sentence(),
        fullName: '${faker.person.firstName()} ${faker.person.lastName()}',
        stories: List<Story>.generate(
          (random.nextInt(9) + 1),
          (storyIndex) {
            if (random.nextBool() == true) {
              return Story(
                url: videoStories[storyIndex].url,
                media: MediaType.video,
                duration: videoStories[storyIndex].duration,
              );
            } else {
              return Story(
                url: 'https://source.unsplash.com/random?sig=$storyIndex',
                media: MediaType.image,
                duration: const Duration(seconds: 10),
              );
            }
          },
        ),
      );
    },
  );
}

User generateUser() {
  String menOrWomen = random.nextBool() == true ? 'women' : 'men';
  return User(
    verified: random.nextBool(),
    userName: faker.internet.userName(),
    profileImageUrl:
        'https://randomuser.me/api/portraits/$menOrWomen/${random.nextInt(85)}.jpg',
    bio: faker.lorem.sentence(),
    fullName: '${faker.person.firstName()} ${faker.person.lastName()}',
    stories: List<Story>.generate(
      (random.nextInt(9) + 1),
      (storyIndex) {
        if (random.nextBool() == true) {
          return Story(
            url: videoStories[storyIndex].url,
            media: MediaType.video,
            duration: videoStories[storyIndex].duration,
          );
        } else {
          return Story(
            url: 'https://source.unsplash.com/random?sig=$storyIndex',
            media: MediaType.image,
            duration: const Duration(seconds: 10),
          );
        }
      },
    ),
  );
}

List<int> generateRandomList(int postLength, int userIndex) {
  int randomCount = postLength;
  int avoid = 10;
  List<int> randomNumbers = [];
  var rand = Random();

  while (randomNumbers.length != randomCount) {
    int r = rand.nextInt(100);
    if (r != avoid) {
      randomNumbers.add(r);
    }
  }
  /*for (var element in randomNumbers) {
    print('PostLength: $postLength User: $userIndex and Element $element');
  }*/
  return randomNumbers;
}
