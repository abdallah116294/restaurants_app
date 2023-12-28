import 'package:dartz/dartz.dart';
//import 'package:returants_app/Features/domain/entity/restaurant_detial_entity.dart';
//import 'package:returants_app/Features/domain/entity/restaurant_entity.dart';
import 'package:returants_app/Features/domain/repository/get_list_restaurants_repo.dart';
import 'package:returants_app/core/error/failure.dart';
import 'package:returants_app/core/usecase/usecase.dart';

import '../../test_model.dart';

class GetRestaurantDetialsUseCase implements Usecase<Restaurant, String> {
  GetListRestaurants getListRestaurants;
  GetRestaurantDetialsUseCase({required this.getListRestaurants});
  @override
  Future<Either<Failure, Restaurant>> call(String id) =>
      getListRestaurants.getRestaurantDetail(id);
}
