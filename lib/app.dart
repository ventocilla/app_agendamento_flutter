import 'package:flutter/material.dart';

import 'core/flavor/flavor_config.dart';
import 'core/route/app_routes.dart';

void boostrap(FlavorConfig config) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
