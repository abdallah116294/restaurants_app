import 'package:dartz/dartz.dart';
import 'package:returants_app/Features/data/datasource/remote_data_source.dart';
import 'package:returants_app/Features/domain/entity/restaurantdata_entity.dart';
import 'package:returants_app/Features/domain/repository/get_list_restaurants_repo.dart';
import 'package:returants_app/core/error/exception.dart';
import 'package:returants_app/core/error/failure.dart';

class GetListRestaurantsImpl implements GetListRestaurants {
  RemoteDataSource remoteDataSource;
  GetListRestaurantsImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, RestaurantDataEntity>> getRestaurantsList() async {
    try {
      final response = await remoteDataSource.getRestaurantsData();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
