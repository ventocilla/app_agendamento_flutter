import 'package:app_agendamento_flutter/core/helpers/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../core/helpers/result.dart';
import '../models/user.dart';
import 'results/login_failed_result.dart';

class AuthDatasource {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://parseapi.back4app.com/functions/',
    headers: {
      'X-Parse-Application-Id': '7dtZvj7DXFRzhcuRy5q8Y5KNTBeHJPjnKPDdB26e',
      'X-Parse-REST-API-Key': '70dbXHQiGosPXaawxvDUYVaBudfNyrwa24M31t7Q',
    },
  ))
    ..interceptors.addAll([
      TokenInterceptor(),
      PrettyDioLogger(requestHeader: true, requestBody: true),
    ]);

  Future<Result<LoginFailedResult, User>> login(
      {required String email, required String password}) async {
    try {
      final response = await _dio.post('v1-sign-in', data: {
        email: email,
        password: password,
      });
      return Success(User.fromMap(response.data['result']));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        return const Failure(LoginFailedResult.offline);
      } else if (e.response?.statusCode == 404) {
        return const Failure(LoginFailedResult.invalidCredentials);
      }
      return const Failure(LoginFailedResult.unknownError);
    } catch (_) {
      return const Failure(LoginFailedResult.unknownError);
    }
  }
}
