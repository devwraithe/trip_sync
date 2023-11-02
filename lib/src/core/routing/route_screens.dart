import 'package:flutter/material.dart';
import 'package:trip_sync/src/core/routing/routes.dart';
import 'package:trip_sync/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:trip_sync/src/features/authentication/presentation/screens/register_screen.dart';
import 'package:trip_sync/src/features/trips/screens/trips_screen.dart';

final routesConfig = <String, WidgetBuilder>{
  // Auth route screens
  Routes.signUp: (context) => const RegisterScreen(),
  Routes.signIn: (context) => const LoginScreen(),

  // Trip route screens
  Routes.trips: (context) => const TripsScreen(),
};
