import 'package:dartz/dartz.dart';
import 'package:returants_app/Features/domain/repository/get_list_restaurants_repo.dart';
import 'package:returants_app/core/error/failure.dart';
import 'package:returants_app/core/usecase/usecase.dart';

class GetRestaurantsUsecase implements Usecase<dynamic, NoParmas> {
  GetListRestaurants getListRestaurants;
  GetRestaurantsUsecase({required this.getListRestaurants});
  @override
  Future<Either<Failure, dynamic>> call(params) =>
      getListRestaurants.getRestaurantsList();
}
