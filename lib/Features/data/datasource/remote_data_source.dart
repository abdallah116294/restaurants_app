import 'package:returants_app/Features/data/model/restaurantdata_model.dart';
import 'package:returants_app/core/api/api_consumer.dart';
import 'package:returants_app/core/api/api_endpoints.dart';

abstract class RemoteDataSource {
  Future<RestaurantDataModel> getRestaurantsData();
}

class RemoteDataSourceimpl implements RemoteDataSource {
  ApiConsumer apiConsumer;
  RemoteDataSourceimpl({required this.apiConsumer});
  @override
  Future<RestaurantDataModel> getRestaurantsData() async {
    final response = await apiConsumer.gt(ApiEndPoints.listRestaurants);
    return RestaurantDataModel.formJson(response);
  }
}
