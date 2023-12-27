import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:returants_app/Features/domain/entity/restaurantdata_entity.dart';
import 'package:returants_app/Features/domain/usecase/get_restaurants_usecase.dart';
import 'package:returants_app/core/error/failure.dart';
import 'package:returants_app/core/usecase/usecase.dart';

part 'get_restaurants_state.dart';

class GetRestaurantsCubit extends Cubit<GetRestaurantsState> {
  GetRestaurantsCubit({required this.getRestaurantsUsecase})
      : super(GetRestaurantsInitial());
  GetRestaurantsUsecase getRestaurantsUsecase;
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
