import '../constants/app_constants.dart';

class Location {
  const Location({
    required this.name,
    required this.place,
    required this.photoId,
  });

  final String name;
  final String place;
  final String photoId;

  String get imageUrl => ImageConfig.getImageUrl(photoId);
}
