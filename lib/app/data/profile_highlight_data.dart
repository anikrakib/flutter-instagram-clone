import '../../generated/assets.dart';

class Highlight {
  String thumbnail;
  String title;
  Highlight({required this.thumbnail, required this.title});
}

List<Highlight> highlightItems = [
  Highlight(thumbnail: Assets.highLightImagesCamp, title: "Camp ⛺"),
  Highlight(thumbnail: Assets.highLightImagesBike, title: "My Bike 🏍"),
  Highlight(thumbnail: Assets.highLightImagesCooking, title: "Cooking 🔪"),
  Highlight(thumbnail: Assets.highLightImagesNature, title: "Nature 🏞"),
  Highlight(thumbnail: Assets.highLightImagesPet, title: "Pet ❤️"),
  Highlight(thumbnail: Assets.highLightImagesSwimming, title: "Pool 🌊"),
  Highlight(thumbnail: Assets.highLightImagesYoga, title: "Yoga 💪🏻"),
];