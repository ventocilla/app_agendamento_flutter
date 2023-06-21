import 'package:flutter/material.dart';
import 'core/di/di.dart';
import 'core/flavor/flavor_config.dart';
import 'core/helpers/result.dart';
import 'core/route/app_routes.dart';
import 'features/auth/data/auth_repository.dart';

Future<void> boostrap(FlavorConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependecies(config);
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    final AuthRepository authRepository = getIt();
    final result = await authRepository.login(
      email: 'ventocilla.leo@gmail.com',
      password: '12345678',
    );
    switch (result) {
      case Success(object: final user):
        print('sucsess ${user.fullname}');
      case Failure(error: final error):
        print('app $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
