import 'package:equatable/equatable.dart';
import 'package:returants_app/Features/domain/entity/restaurants_entity.dart';

class RestaurantDataEntity extends Equatable {
  bool? error;
  String? message;
  int? count;
  List<Restaurants>? restaurants;
  RestaurantDataEntity(
      {required this.error, required this.message, required this.restaurants});
  @override

  List<Object?> get props => [
    error,
    message,
    count,
    restaurants
  ];
}
