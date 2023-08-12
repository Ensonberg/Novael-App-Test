import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novael/core/routes/routes.dart';
import 'package:novael/features/onbarding/presentation/screens/onboarding_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  restorationScopeId: "app",
  routes: [
    GoRoute(
      path: '/',
      name: Routes.ONBARDING,
      builder: (context, state) => const OnBoardingScreen(),
    ),
  ],
);
