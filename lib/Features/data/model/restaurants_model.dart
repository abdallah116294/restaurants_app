import 'package:returants_app/Features/domain/entity/restaurants_entity.dart';

class RestaurantsModel extends Restaurants {
  RestaurantsModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.pictureId,
      required super.city,
      required super.rating});
  factory RestaurantsModel.fromJson(Map<String, dynamic> json) {
    return RestaurantsModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        rating: json['rating']);
  }
}
