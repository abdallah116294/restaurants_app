import 'package:returants_app/Features/data/model/restaurants_model.dart';
import 'package:returants_app/Features/domain/entity/restaurantdata_entity.dart';

class RestaurantDataModel extends RestaurantDataEntity {
  RestaurantDataModel(
      {required super.error,
      required super.message,
      required super.restaurants});
  factory RestaurantDataModel.formJson(Map<String, dynamic> json) {
    List<RestaurantsModel> restaurants=(json["restaurants"] as List).map((e) => RestaurantsModel.fromJson(e)).toList();
    return RestaurantDataModel(
        error: json['error'],
        message: json['message'],
        restaurants: restaurants);
  }
}
