import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:returants_app/core/api/api_consumer.dart';
import 'package:returants_app/core/api/api_endpoints.dart';
import 'package:returants_app/core/api/app_interceptors.dart';
import 'package:returants_app/core/api/status_code.dart';
import 'package:returants_app/core/error/exception.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;
  DioConsumer({required this.client}) {
    client.options
      ..baseUrl = ApiEndPoints.basurl
      ..responseType = ResponseType.plain
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    client.interceptors.add(AppInterceptors());
  }
  @override
  Future gt(String pathe, {Map<String, dynamic>? queryParametes}) async {
    try {
      final response = await client.get(pathe, queryParameters: queryParametes);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = json.decode(response.data.toString());
    return responseJson;
  }

  dynamic _handleDioError(DioException error) {
    if (error.type
        case DioExceptionType.connectionTimeout ||
            DioExceptionType.sendTimeout ||
            DioException.receiveTimeout) {
      throw const FetchDataException();
    } else if (error.type case DioExceptionType.values) {
      switch (error.response?.statusCode) {
        case StatusCode.badRequest:
          throw const BadRequestException();
        case StatusCode.unauthorized:
        case StatusCode.forbidden:
          throw const UnauthorizedException();
        case StatusCode.notFound:
          throw const NotFoundException();
        case StatusCode.confilct:
          throw const ConflictException();

        case StatusCode.internalServerError:
          throw const InternalServerErrorException();
      }
    } else if (error.type case DioExceptionType.cancel) {
    } else if (error.type case DioExceptionType.unknown) {
      throw const NoInternetConnectionException();
    } else if (error.type
        case DioExceptionType.receiveTimeout ||
            DioExceptionType.badCertificate) {}
  }
}
