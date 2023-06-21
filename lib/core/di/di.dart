import 'package:app_agendamento_flutter/core/flavor/flavor_config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/auth_datasource.dart';
import '../../features/auth/data/auth_repository.dart';
import '../helpers/token_interceptor.dart';

final getIt = GetIt.I;

Future<void> configureDependecies(FlavorConfig config) async {
  getIt.registerSingleton(config);
  getIt.registerSingleton(Dio(BaseOptions(
    baseUrl: config.baseurl,
    headers: {
      'X-Parse-Application-Id': config.appId,
      'X-Parse-REST-API-Key': config.restKey,
    },
  ))
    ..interceptors.addAll([
      TokenInterceptor(),
      if (config.flavor == AppFlavor.dev)
        PrettyDioLogger(requestHeader: true, requestBody: true),
    ]));

  final preferences = await SharedPreferences.getInstance();
  getIt.registerSingleton(preferences);

  getIt.registerFactory<AuthDatasource>(() => RemoteAuthDatasource(getIt()));
  getIt.registerLazySingleton(() => AuthRepository(getIt(), getIt()));
}
