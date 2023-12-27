import 'package:dartz/dartz.dart';
import 'package:returants_app/Features/domain/entity/restaurantdata_entity.dart';
import 'package:returants_app/core/error/failure.dart';

abstract class GetListRestaurants{
  Future<Either<Failure,RestaurantDataEntity>>getRestaurantsList();
}