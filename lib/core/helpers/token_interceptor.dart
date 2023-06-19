import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  //final AuthRepository authRepository;
  // final AuthRepository authRepository = AuthRepository();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //options.headers['X-Parse-Session-Token'] = authRepository.user?.token;
    options.headers['X-Parse-Session-Token'] = '123';
    handler.next(options);
    // authRepository.user?.sessionToken;
  }
}
