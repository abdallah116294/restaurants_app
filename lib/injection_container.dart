import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:returants_app/Features/data/datasource/remote_data_source.dart';
import 'package:returants_app/Features/data/repository/get_list_restaurants_repo_imp.dart';
import 'package:returants_app/Features/domain/repository/get_list_restaurants_repo.dart';
import 'package:returants_app/Features/domain/usecase/get_restaurants_usecase.dart';
import 'package:returants_app/Features/presentations/cubit/get_restaurants_cubit.dart';
import 'package:returants_app/core/api/api_consumer.dart';
import 'package:returants_app/core/api/app_interceptors.dart';
import 'package:returants_app/core/api/dio_consumer.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //cubit
  sl.registerFactory<GetRestaurantsCubit>(() => GetRestaurantsCubit(getRestaurantsUsecase: sl()));
  //usecase
  sl.registerLazySingleton<GetRestaurantsUsecase>(
      () => GetRestaurantsUsecase(getListRestaurants: sl()));
  // repository
  sl.registerLazySingleton<GetListRestaurants>(
      () => GetListRestaurantsImpl(remoteDataSource: sl()));
  // data sourc
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceimpl(apiConsumer: sl()));
  // core
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => Dio());
}
