part of 'get_restaurants_cubit.dart';

sealed class GetRestaurantsState extends Equatable {
  const GetRestaurantsState();

  @override
  List<Object> get props => [];
}

final class GetRestaurantsInitial extends GetRestaurantsState {}

class GetRestaurantsIsLoadingState extends GetRestaurantsState {}

class GetRestaurantsLoadedState extends GetRestaurantsState {
  final RestaurantDataEntity restaurantDataEntity;
  const GetRestaurantsLoadedState({required this.restaurantDataEntity});
}

class GetRestaurantsErrorState extends GetRestaurantsState {
  final String error;
 const  GetRestaurantsErrorState({required this.error});
}
