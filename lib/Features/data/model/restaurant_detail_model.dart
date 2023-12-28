import 'package:returants_app/Features/data/model/restaurant_model.dart';
import 'package:returants_app/Features/domain/entity/restaurant_detial_entity.dart';

class RestaurantDetailModel extends RestaurnatDetailEntity {
  const RestaurantDetailModel(
      {required super.error,
      required super.message,
      required super.restaurant});
  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) {
    return RestaurantDetailModel(
        error: json['error'],
        message: json['message'],
        restaurant: RestaurantModel.fromJson(json));
  }
}
