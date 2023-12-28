//import 'package:returants_app/Features/data/model/restaurant_detail_model.dart';
import 'package:returants_app/Features/data/model/restaurantdata_model.dart';
import 'package:returants_app/Features/domain/entity/restaurantdata_entity.dart';
//import 'package:returants_app/Features/domain/entity/restaurant_entity.dart';
import 'package:returants_app/Features/test_model.dart';
import 'package:returants_app/core/api/api_consumer.dart';
import 'package:returants_app/core/api/api_endpoints.dart';

abstract class RemoteDataSource {
  Future<RestaurantDataModel> getRestaurantsData();
  Future<Restaurant> getRestaurantDetail(String id);
  Future<RestaurantDataEntity> searchRestaurants(String item);
}

class RemoteDataSourceimpl implements RemoteDataSource {
  ApiConsumer apiConsumer;
  RemoteDataSourceimpl({required this.apiConsumer});
  @override
  Future<RestaurantDataModel> getRestaurantsData() async {
    final response = await apiConsumer.gt(ApiEndPoints.listRestaurants);
    return RestaurantDataModel.formJson(response);
  }

  @override
  Future<Restaurant> getRestaurantDetail(String id) async {
    final response = await apiConsumer.gt(ApiEndPoints.restaurantDetails + id);
    //return Restaurant.fromJson(json).;
    return Restaurant.fromJson(response);
  }

  @override
  Future<RestaurantDataEntity> searchRestaurants(String item) async {
    final response = await apiConsumer
        .gt(ApiEndPoints.searchEndpoinst, queryParametes: {"q": item});
    return RestaurantDataModel.formJson(response);
  }
}
