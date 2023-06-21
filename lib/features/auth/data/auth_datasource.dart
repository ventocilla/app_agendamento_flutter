import 'package:dio/dio.dart';

import '../../../core/helpers/result.dart';
import '../models/user.dart';
import 'results/login_failed_result.dart';

abstract class AuthDatasource {
  Future<Result<LoginFailedResult, User>> login(
      {required String email, required String password});
}

class RemoteAuthDatasource implements AuthDatasource {
  RemoteAuthDatasource(this._dio);

  final Dio _dio;

  @override
  Future<Result<LoginFailedResult, User>> login(
      {required String email, required String password}) async {
    try {
      final response = await _dio.post('/v1-sign-in', data: {
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
