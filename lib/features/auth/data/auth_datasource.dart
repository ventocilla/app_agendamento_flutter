import 'package:dio/dio.dart';

import '../models/user.dart';

class AuthDatasource {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://parseapi.back4app.com/functions/',
    headers: {
      'X-Parse-Application-Id': '7dtZvj7DXFRzhcuRy5q8Y5KNTBeHJPjnKPDdB26e',
      'X-Parse-REST-API-Key': '70dbXHQiGosPXaawxvDUYVaBudfNyrwa24M31t7Q',
    },
  ));

  Future<User> login({required String email, required String password}) async {
    final response = await _dio.post('v1-sign-in', data: {
      email: email,
      password: password,
    });
    return User.fromMap(response.data['result']);
  }
}
