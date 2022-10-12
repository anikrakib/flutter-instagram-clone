import 'dart:math';
import 'package:faker/faker.dart';
import 'package:instagram_clone/app/data/story_data.dart';
import 'package:instagram_clone/app/model/story_model.dart';
import 'package:instagram_clone/app/model/user_model.dart';

var faker = Faker();

var userList = List<User>.generate(20, (index) {
  var random = Random();
  String menOrWomen = random.nextBool() == true ? 'women' : 'men';

  return User(
    userName: faker.internet.userName(),
    profileImageUrl:
        'https://randomuser.me/api/portraits/$menOrWomen/$index.jpg',
    bio: faker.lorem.sentence(),
    fullName: '${faker.person.firstName()} ${faker.person.lastName()}',
    stories: List<Story>.generate(
      (random.nextInt(9)+1),
      (index) {
        if (random.nextBool() == true) {
          return Story(
            url: videoStories[index].url,
            media: MediaType.video,
            duration: videoStories[index].duration,
          );
        } else {
          return Story(
            url: 'https://source.unsplash.com/random?sig=$index',
            media: MediaType.image,
            duration: const Duration(seconds: 10),
          );
        }
      },
    ),
  );
});
