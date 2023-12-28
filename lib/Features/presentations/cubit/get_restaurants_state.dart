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
  const GetRestaurantsErrorState({required this.error});
}

class GetRestaurantDetailsIsloading extends GetRestaurantsState {}

class GetRestaurantDetailsLoaded extends GetRestaurantsState {
  final Restaurant restaurnatDetailEntity;
  const GetRestaurantDetailsLoaded({required this.restaurnatDetailEntity});
}

class GetRestaurantDetailsError extends GetRestaurantsState {
  final String message;
  const GetRestaurantDetailsError({required this.message});
}

class GetSearchItemIsloading extends GetRestaurantsState {}

class GetSearchItemLoaded extends GetRestaurantsState {
  RestaurantDataEntity restaurantDataEntity;
  GetSearchItemLoaded({required this.restaurantDataEntity});
}

class GetSearchItemError extends GetRestaurantsState {
  final String message;
 const  GetSearchItemError({required this.message});
}
