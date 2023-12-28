import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:returants_app/Features/domain/entity/restaurant_detial_entity.dart';
import 'package:returants_app/Features/domain/entity/restaurantdata_entity.dart';
import 'package:returants_app/Features/domain/usecase/get_restaurant_detail.dart';
import 'package:returants_app/Features/domain/usecase/get_restaurants_usecase.dart';
import 'package:returants_app/Features/domain/usecase/search_restaurants_usecase.dart';
import 'package:returants_app/core/error/failure.dart';
import 'package:returants_app/core/usecase/usecase.dart';

import '../../test_model.dart';

part 'get_restaurants_state.dart';

class GetRestaurantsCubit extends Cubit<GetRestaurantsState> {
  GetRestaurantsCubit(
      {required this.getRestaurantsUsecase,
      required this.restaurantDetialsUseCase,
      required this.searchRestaurnatUsecase})
      : super(GetRestaurantsInitial());
  GetRestaurantsUsecase getRestaurantsUsecase;
  GetRestaurantDetialsUseCase restaurantDetialsUseCase;
  SearchRestaurnatUsecase searchRestaurnatUsecase;
  Future<void> getRestaurants() async {
    emit(GetRestaurantsIsLoadingState());
    try {
      Either<Failure, RestaurantDataEntity> response =
          await getRestaurantsUsecase.call(NoParmas());
      emit(response.fold(
          (l) => GetRestaurantsErrorState(error: _mapFailureToMsg(l)),
          (r) => GetRestaurantsLoadedState(restaurantDataEntity: r)));
    } catch (error) {
      emit(GetRestaurantsErrorState(error: error.toString()));
    }
  }

  Future<void> getRestaurantDetails(String id) async {
    emit(GetRestaurantDetailsIsloading());
    try {
      Either<Failure, Restaurant> response = await restaurantDetialsUseCase(id);
      emit(response.fold(
          (l) => GetRestaurantDetailsError(message: _mapFailureToMsg(l)),
          (r) => GetRestaurantDetailsLoaded(restaurnatDetailEntity: r)));
    } catch (error) {
      emit(GetRestaurantDetailsError(message: error.toString()));
    }
  }

  Future<void> searchRestaurant(String item) async {
    emit(GetSearchItemIsloading());
    try {
      Either<Failure, RestaurantDataEntity> response =
          await searchRestaurnatUsecase(item);
      emit(response.fold(
          (l) => GetSearchItemError(message: _mapFailureToMsg(l)),
          (r) => GetSearchItemLoaded(restaurantDataEntity: r)));
    } catch (error) {
      emit(GetSearchItemError(message: error.toString()));
    }
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "ServerFailure";
      case CacheFailure:
        return "CacheFailure";

      default:
        return "unexpectedError";
    }
  }
}
