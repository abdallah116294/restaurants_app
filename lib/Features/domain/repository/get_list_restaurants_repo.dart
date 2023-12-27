import 'package:dartz/dartz.dart';
import 'package:returants_app/core/error/failure.dart';

abstract class GetListRestaurants{
  Future<Either<Failure,dynamic>>getRestaurantsList();
}