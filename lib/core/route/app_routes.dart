import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  redirect: (context, state) {
    return null;
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return Container(color: Colors.yellow);
      },
    ),
    GoRoute(
      path: 'auth',
      builder: (BuildContext context, GoRouterState state) {
        return Container(color: Colors.green);
      },
    ),
  ],
);
