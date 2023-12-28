import 'package:dartz/dartz.dart';
//import 'package:returants_app/Features/domain/entity/restaurant_detial_entity.dart';
//import 'package:returants_app/Features/domain/entity/restaurant_entity.dart';
import 'package:returants_app/Features/domain/entity/restaurantdata_entity.dart';
import 'package:returants_app/core/error/failure.dart';

import '../../test_model.dart';

abstract class GetListRestaurants {
  Future<Either<Failure, RestaurantDataEntity>> getRestaurantsList();
  Future<Either<Failure, Restaurant>> getRestaurantDetail(String id);
  Future<Either<Failure, RestaurantDataEntity>> searchRestaurant(String item);
}
